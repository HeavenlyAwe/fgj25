class_name Ingredient extends Interactable

signal ingredient_interaction(Texture)

func _ready() -> void:
	_on_target_changed.connect(_on_interaction)
#signal _on_target_changed(Vector2, Callable)
#
#func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#var callback = func():
			#print("callback: " + self.name)
		#_on_target_changed.emit(position, callback)

func _on_interaction(position: Vector2, callback: Callable) -> void:
	print("Interaction registered")
	ingredient_interaction.emit(texture)
