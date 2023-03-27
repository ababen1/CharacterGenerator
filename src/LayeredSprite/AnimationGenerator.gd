extends AnimationPlayer

export(String, DIR) var output

const SCHEME = [
	"anim_name",
	"direction",
	"from",
	"to",
	"loop"]

func _ready() -> void:
	pass

func _generate_animation_files(save_to_disk: = true):
	for data in AnimationsData.ANIMATIONS:
		var anim_name = data["anim_name"] + "_" + data["direction"]
		var anim_to_modify = get_animation(anim_name)
		if not anim_to_modify:
			anim_to_modify = Animation.new()
		anim_to_modify.loop = data["loop"]
		anim_to_modify.length = data["from"].distance_to(data["to"]) / 10
		if data["from"].x - data["to"].x == 0:
			anim_to_modify.length = 0.1
		_create_track(anim_to_modify, data)
		if save_to_disk:
# warning-ignore:return_value_discarded
			ResourceSaver.save(output.plus_file(anim_name) + ".res", anim_to_modify)
	save_changes_made_to_scene(get_tree().current_scene)

static func save_changes_made_to_scene(scene):
	var packed_scene = PackedScene.new()
	packed_scene.pack(scene)	
# warning-ignore:return_value_discarded
	ResourceSaver.save(scene.filename, packed_scene)
		
func _create_track(anim: Animation, data: Dictionary):
	var track_idx: int = anim.find_track(".:frame_coords")
	if track_idx == -1:
		track_idx = anim.add_track(Animation.TYPE_VALUE)
	anim.track_set_path(track_idx, ".:frame_coords")
	anim.value_track_set_update_mode(track_idx, Animation.UPDATE_DISCRETE)
	_inset_keys(anim, track_idx, data)
	
func _inset_keys(anim: Animation, track: int, data: Dictionary):
	var current_frame_cords = data["from"]
	var current_time: = 0.0
	while current_frame_cords.x <= data["to"].x:
		anim.track_insert_key(track, current_time, current_frame_cords)
		current_time += 0.1
		current_frame_cords.x += 1

