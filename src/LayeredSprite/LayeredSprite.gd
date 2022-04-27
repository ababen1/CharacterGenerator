tool
extends Node2D
class_name LayeredSprite

const DIRECTIONS = {
	Vector2.DOWN: "down",
	Vector2.UP: "up",
	Vector2.LEFT: "left",
	Vector2.RIGHT: "right"
}

export var sheet_size: = Vector2()
export var tile_size: = Vector2() setget set_tile_size
export var frame_coords: Vector2 setget set_frame_coords

onready var anim_player = $AnimationPlayer

var layers: Array setget ,get_layers
var current_direction: = Vector2.DOWN setget set_current_direction

#func _enter_tree() -> void:
#	if Engine.editor_hint:
#		randomize_character()

func _ready() -> void:
	for layer in get_layers():
		layer.current_texture = -1 if layer.can_be_empty else 0
	anim_player.play("RESET")
	anim_player.queue("idle_down")

func set_tile_size(val: Vector2) -> void:
	if not is_inside_tree():
		yield(self, "ready")
	tile_size = val
	for layer in get_layers():
		layer.region_enabled = true
		layer.region_rect.size = tile_size

func set_frame_coords(val: Vector2):
	if not is_inside_tree():
		yield(self, "ready")
	frame_coords = val
	for layer in get_layers():
		layer.region_rect.position = frame_coords * tile_size

func set_layer_texture(layer: String, texture_idx: int) -> void:
	get_layer(layer).set_current_texture(texture_idx)

func set_current_direction(val: Vector2):
	if not val in DIRECTIONS:
		return
	current_direction = val
	if anim_player.current_animation:
		var current_animation = (
			anim_player.current_animation.split("_", false, 1))[0]
		play_animation(current_animation, current_direction)

func play_animation(
	anim_name: String, 
	direction: Vector2 = current_direction) -> void:
		var anim_to_play = "{name}_{direction}".format({
			"name": anim_name,
			"direction": DIRECTIONS[direction]})
		anim_player.play(anim_to_play)

func get_layers() -> Array:
	var sprite_layers: = []
	for child in get_children():
		if child is SpriteLayer:
			sprite_layers.append(child)
	return sprite_layers

func get_layer(layer_name: String) -> SpriteLayer:
	for layer in get_layers():
		if layer.layer_name == layer_name:
			return layer
	return null

func randomize_character() -> void:
	for layer in get_layers():
		layer.set_random_texture()
