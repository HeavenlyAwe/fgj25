extends Movable

@export var target: Vector2 = Vector2.ZERO

signal _on_despawn()

func leave_shop() -> void:
	var cb1 = func():
		print("Bye bye!")
		self.queue_free()
		_on_despawn.emit()
	move_to_position(target, cb1)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		leave_shop()
