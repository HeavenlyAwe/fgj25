class_name Movable extends Node2D

@export var SPEED: float = 1000
@export var last_direction = 0

signal _on_move_started()
signal _on_move_completed()

func _done_moving():
	_on_move_completed.emit()
	

func move_to_position(target: Vector2, callback: Callable):
	print("Move to position")
	_on_move_started.emit()
	
	target = Vector2(target.x, position.y)
	var duration = position.distance_to(target) / SPEED
	var tween = create_tween()
	
	var new_direction = position.direction_to(target).x
	
	if new_direction != last_direction:
		self.flip_h = !self.flip_h
	last_direction = new_direction
	
	tween.tween_property(self, "position", target, duration)
	tween.tween_callback(callback)
	tween.tween_callback(_done_moving)
