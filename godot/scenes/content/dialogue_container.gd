extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialgoue_start: String = "start"

func triggered() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialgoue_start)
