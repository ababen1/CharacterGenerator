extends Resource
class_name AnimationsData

const SHEET_SIZE = Vector2(55,20)

const ANIMATIONS = [
	{
		"anim_name": "static",
		"direction": "right",
		"from": Vector2(0,0),
		"to": Vector2(0,0),
		"loop": true
	},
	{
		"anim_name": "static",
		"direction": "up",
		"from": Vector2(1,0),
		"to": Vector2(0,0),
		"loop": true
	},
	{
		"anim_name": "static",
		"direction": "left",
		"from": Vector2(2,0),
		"to": Vector2(0,0),
		"loop": true
	},
	{
		"anim_name": "static",
		"direction": "down",
		"from": Vector2(3,0),
		"to": Vector2(0,0),
		"loop": true
	},
	{
		"anim_name": "idle",
		"direction": "right",
		"from": Vector2(0,1),
		"to": Vector2(5,1),
		"loop": true
	},
	{
		"anim_name": "idle",
		"direction": "up",
		"from": Vector2(6,1),
		"to": Vector2(11,1),
		"loop": true
	},
	{
		"anim_name": "idle",
		"direction": "left",
		"from": Vector2(12,1),
		"to": Vector2(17,1),
		"loop": true
	},
	{
		"anim_name": "idle",
		"direction": "down",
		"from": Vector2(18,1),
		"to": Vector2(23,1),
		"loop": true
	},
	{
		"anim_name": "walk",
		"direction": "right",
		"from": Vector2(0,2),
		"to": Vector2(5,2),
		"loop": true
	},
	{
		"anim_name": "walk",
		"direction": "up",
		"from": Vector2(6,2),
		"to": Vector2(11,2),
		"loop": true
	},
	{
		"anim_name": "walk",
		"direction": "left",
		"from": Vector2(12,2),
		"to": Vector2(17,2),
		"loop": true
	},
	{
		"anim_name": "walk",
		"direction": "down",
		"from": Vector2(18,2),
		"to": Vector2(23,2),
		"loop": true
	},
	{
		"anim_name": "sleep",
		"direction": "down",
		"from": Vector2(0,3),
		"to": Vector2(5,3),
		"loop": false
	},
	{
		"anim_name": "sit1",
		"direction": "right",
		"from": Vector2(0,4),
		"to": Vector2(5,4),
		"loop": true
	},
	{
		"anim_name": "sit1",
		"direction": "left",
		"from": Vector2(6,4),
		"to": Vector2(11,4),
		"loop": true
	},
	{
		"anim_name": "sit2",
		"direction": "right",
		"from": Vector2(0,5),
		"to": Vector2(5,5),
		"loop": true
	},
	{
		"anim_name": "sit2",
		"direction": "left",
		"from": Vector2(6,5),
		"to": Vector2(11,5),
		"loop": true
	},
	{
		"anim_name": "take-out-phone",
		"direction": "down",
		"from": Vector2(0,6),
		"to": Vector2(2,6),
		"loop": false
	},
	{
		"anim_name": "phone-loop",
		"direction": "down",
		"from": Vector2(3,6),
		"to": Vector2(8,6),
		"loop": true
	},
	{
		"anim_name": "put-back-phone",
		"direction": "down",
		"from": Vector2(9,6),
		"to": Vector2(11,6),
		"loop": false
	},
	{
		"anim_name": "book",
		"direction": "down",
		"from": Vector2(0,7),
		"to": Vector2(5,7),
		"loop": true
	},
	{
		"anim_name": "flip-page",
		"direction": "down",
		"from": Vector2(6,7),
		"to": Vector2(11,7),
		"loop": false
	}
]
