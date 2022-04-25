extends Node2D

const DIRECTIONS = {
	Vector2.DOWN: "down",
	Vector2.UP: "up",
	Vector2.LEFT: "left",
	Vector2.RIGHT: "right"
}

onready var character = $Adult
onready var customized_parts = $CanvasLayer/Control/VBox/HBox/Customize
onready var viewport_container = find_node("ViewportContainer")

func _ready() -> void:
	_render_character_to_ui()
	customized_parts.setup(character)
	randomize()
	
func _render_character_to_ui():
		var viewport = Viewport.new()
		viewport.transparent_bg = true
		viewport.size = character.tile_size
		viewport_container.rect_min_size = character.tile_size * viewport_container.stretch_shrink
		viewport_container.add_child(viewport)
		yield(get_tree(), "idle_frame")
		character.get_parent().remove_child(character)
		viewport.add_child(character)
		
func _on_CharDirection_set_char_direction(direction) -> void:
	var anim_player: AnimationPlayer = character.get_node("AnimationPlayer")
	var current_anim = anim_player.current_animation.split("_")[0]
	anim_player.play(current_anim + "_" + DIRECTIONS[direction])


func _on_Save_pressed() -> void:
	pass

