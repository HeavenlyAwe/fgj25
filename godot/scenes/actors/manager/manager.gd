extends Movable

@export var audio_player: AudioStreamPlayer

func manager_exit() -> void:
	var cb1 = func():
		print("Manager has exited the building")
		$"../CustomerSpawner".spawn_new_customer()
		audio_player.stop()
	self.move_to_position($"../FixedAnchors/ManagerSpawnPoint".position, cb1)
