class_name Movable extends Node2D

@export var SPEED: float = 1000

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
	
	if target.x - position.x < 0:
		self.scale.x = -0.5
	else:
		self.scale.x = +0.5
	
	tween.tween_property(self, "position", target, duration)
	tween.tween_callback(callback)
	tween.tween_callback(_done_moving)
