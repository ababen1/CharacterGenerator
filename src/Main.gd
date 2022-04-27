extends Node2D

onready var character = $Adult
onready var customized_parts = $CanvasLayer/Control/VBox/HBox/Customize
onready var viewport_container = find_node("ViewportContainer")
onready var viewport: Viewport = $CanvasLayer/Control/VBox/HBox/CC/ViewportContainer/Viewport
onready var file_dialog = $CanvasLayer/Control/FileDialog

export var char_scale: = 4.0

func _ready() -> void:
	_render_character_to_ui()
	customized_parts.setup(character)
	randomize()
	
func _render_character_to_ui():
		viewport_container.rect_min_size = character.tile_size * char_scale
		viewport.size = viewport_container.rect_min_size 
		yield(get_tree(), "idle_frame")
		character.get_parent().remove_child(character)
		viewport.add_child(character)
		character.scale *= char_scale
		
func _on_CharDirection_set_char_direction(direction) -> void:
	character.set_current_direction(direction)

func _on_Save_pressed() -> void:
	file_dialog.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_PICTURES)
	file_dialog.popup()
	character.play_animation("static")
	var path: String = yield(file_dialog, "file_selected")
	var img_data: = viewport.get_texture().get_data()
	img_data.flip_y()
# warning-ignore:return_value_discarded
	img_data.save_png(path)

func _on_FileDialog_popup_hide() -> void:
	character.play_animation("idle")
