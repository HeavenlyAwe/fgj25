extends Sprite2D

func manager_exit() -> void:
	var cb1 = func():
		pass
	$Node2D2.move_to_position(Vector2(-100, 0), cb1)
