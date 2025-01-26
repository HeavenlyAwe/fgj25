extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialgoue_start: String = "start"
@export var sound_effect: AudioStream
@export var audio_player: AudioStreamPlayer

const Balloon = preload("res://dialogue/balloon.tscn")

func start() -> void:
	print("Starting animation!")
	#DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialgoue_start)
	var cb1 = func():
		var cb2 = func():
			var cb3 = func():
				pass
			$"../Employee".move_to_position($"../Employee".position + Vector2(1, 0), cb3)
			var balloon: Node = Balloon.instantiate()
			get_tree().current_scene.add_child(balloon)
			balloon.start(dialogue_resource, dialgoue_start)
			if is_instance_valid(audio_player) && is_instance_valid(sound_effect):
				audio_player.stream = sound_effect
				audio_player.play()
				print("play audio")
		$"../Employee".move_to_position($"../FixedAnchors/EmployeeDiscussionPoint".position, cb2)
	$"../Manager".move_to_position($"../FixedAnchors/ManagerDiscussionPoint".position, cb1)
	
#func manager_exit() -> void:
	#var cb1 = func():
		#print("Manager has exited the building!")
		#$"../CustomerSpawner".spaw_new_customer()
	#$"../Manager/Node2D2".move_to_position($"../FixedAnchors/ManagerSpawnPoint".position, cb1)
	#
