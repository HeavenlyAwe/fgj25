extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialgoue_start: String = "start"

const Balloon = preload("res://dialogue/balloon.tscn")

func start() -> void:
	print("Starting animation!")
	#DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialgoue_start)
	var cb1 = func():
		var cb2 = func():
			var balloon: Node = Balloon.instantiate()
			get_tree().current_scene.add_child(balloon)
			balloon.start(dialogue_resource, dialgoue_start)
		$"../Employee".move_to_position($"../FixedAnchors/EmployeeDiscussionPoint".position, cb2)
	$"../Manager".move_to_position($"../FixedAnchors/ManagerDiscussionPoint".position, cb1)
	
#func manager_exit() -> void:
	#var cb1 = func():
		#print("Manager has exited the building!")
		#$"../CustomerSpawner".spaw_new_customer()
	#$"../Manager/Node2D2".move_to_position($"../FixedAnchors/ManagerSpawnPoint".position, cb1)
	#
