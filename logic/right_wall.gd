extends Area2D

export var _bounce_direction = -1

func _on_wall_area_entered(area):
	if area.name == "Ball":
		area.direction = (area.direction + Vector2(_bounce_direction, 0)).normalized()
