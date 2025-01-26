extends Interactable

signal _on_accept_payment()

#func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#super(viewport, event, shape_idx)
	#if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#_on_accept_payment.emit()
		
func _on_move_complete() -> void:
	_on_accept_payment.emit($"../CustomerSpawner".current_order_score)
