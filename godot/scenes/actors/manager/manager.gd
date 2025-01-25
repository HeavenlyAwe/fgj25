extends Movable

func manager_exit() -> void:
	var cb1 = func():
		print("Manager has exited the building")
		$"../CustomerSpawner".spawn_new_customer()
	self.move_to_position(Vector2(-100, 0), cb1)
