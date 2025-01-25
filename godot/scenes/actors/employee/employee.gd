extends Movable

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	if mouse_pos.x - position.x < 0:
		scale.x = -1
	else:
		scale.x = 1
	
