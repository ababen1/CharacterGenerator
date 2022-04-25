tool
extends Sprite
class_name SpriteLayer

export var layer_name: String = ""
export(String, DIR) var folder
export var can_be_empty: = false

var textures: Array = []
var current_texture: int = -1 setget set_current_texture

func _ready() -> void:
	textures = get_textures_in_folder(folder)

func set_current_texture(idx: int) -> void:
	current_texture = idx
	if idx >= 0 and idx < textures.size():
		texture = textures[idx]
	else:
		texture = null if can_be_empty else textures[idx]

func set_random_texture() -> void:
	set_current_texture(rand_range(0, textures.size()) as int)

static func get_textures_in_folder(path: String):
	var dir = Directory.new()
	var results = []
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name: String = dir.get_next()
		while file_name != "":
			if ResourceLoader.exists(path.plus_file(file_name)):
				var current_tex = load(path.plus_file(file_name))
				if current_tex is Texture:
					results.append(current_tex)
			file_name = dir.get_next()
	return results
