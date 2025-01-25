extends Node2D

@export var spriteHolders: Array[Node2D] = []

func _ready() -> void:
	for holder in spriteHolders:
		for child in holder.get_children():
			child.texture = null
