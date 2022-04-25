extends HBoxContainer

signal selection_changed

onready var label: = $Label
onready var spin_box: = $SpinBox

var layer: SpriteLayer setget set_sprite_layer

func _ready() -> void:
# warning-ignore:return_value_discarded
	spin_box.connect("value_changed", self, "_on_value_changed")

func set_sprite_layer(val: SpriteLayer) -> void:
	layer = val
	label.text = layer.layer_name.capitalize()
	spin_box.min_value = 0 if layer.can_be_empty else 1
	spin_box.value = spin_box.min_value
	spin_box.max_value = layer.textures.size()

func pick_random() -> void:
	spin_box.value = rand_range(spin_box.min_value, spin_box.max_value)

func _on_value_changed(new_val: float) -> void:
	emit_signal("selection_changed", new_val - 1 as int)
