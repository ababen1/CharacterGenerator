extends VBoxContainer

const LAYER_UI = preload("PartContainer.tscn")

onready var randomize_btn = $Randomize

var layers: = []

func setup(character: LayeredSprite) -> void:
	layers = []
	for layer in character.layers:
		var layer_ui = LAYER_UI.instance()
		layers.append(layer_ui)
		add_child(layer_ui)
		layer_ui.set_sprite_layer(layer)
		layer_ui.connect("selection_changed", layer, "set_current_texture")
	move_child(randomize_btn, get_children().size())


func _on_Randomize_pressed() -> void:
	for spritelayer in layers:
		spritelayer.pick_random()
