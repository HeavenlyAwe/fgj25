extends Sprite2D

var clicked = false

func _on_dialogue_container_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and clicked == false:
		print("Clicked item!")
		clicked = true
		$DialogueContainer.triggered()
		print("done with dialogue")
	pass # Replace with function body.
	
func done() -> void:
	print("done was called")
	clicked = false
