extends VBoxContainer

signal set_char_direction(direction)

func _on_Up_pressed() -> void:
	emit_signal("set_char_direction", Vector2.UP)

func _on_Left_pressed() -> void:
	emit_signal("set_char_direction", Vector2.LEFT)

func _on_Right_pressed() -> void:
	emit_signal("set_char_direction", Vector2.RIGHT)

func _on_Down_pressed() -> void:
	emit_signal("set_char_direction", Vector2.DOWN)
