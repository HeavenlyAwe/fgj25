extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialgoue_start: String = "start"

func start() -> void:
	print("Starting animation!")
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialgoue_start)
