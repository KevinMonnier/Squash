extends Area2D

const MOVE_SPEED = 0.1

var _ball_dir
var _up
var _down
var event

onready var _screen_size_y = get_viewport_rect().size.y

func _ready():
	var n = String(name).to_lower()
	_up = n + "_move_up"
	_down = n + "_move_down"
	if n == "left":
		_ball_dir = 1
	else:
		_ball_dir = -1


func _input(event):
	# Move up and down based on input.
	var input = 0
	if event is InputEventMouseMotion:
		input = event.relative.y
	position.y = clamp(position.y + input * MOVE_SPEED, 16, _screen_size_y - 16)


func _on_area_entered(area):
	if area.name == "Ball":
		# Assign new direction.
		area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
