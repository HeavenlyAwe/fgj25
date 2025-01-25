extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialgoue_start: String = "start"

func start() -> void:
	print("Starting animation!")
	#DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialgoue_start)
	var cb1 = func():
		var cb2 = func():
			DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialgoue_start)
		$"../Employee/Node2D2".move_to_position($"../FixedAnchors/EmployeeDiscussionPoint".position, cb2)
	$"../Manager/Node2D2".move_to_position($"../FixedAnchors/ManagerDiscussionPoint".position, cb1)
	
func manager_exit() -> void:
	var cb1 = func():
		pass
	$"../Manager/Node2D2".move_to_position($"../FixedAnchors/ManagerSpawnPoint".position, cb1)
	
