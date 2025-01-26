extends Node2D

@export var angle: float = 7.0
@export var duration: float = 1.0

var group1 = [
	preload("res://assets/items/Bobas_BrownSugar.png"),
	preload("res://assets/items/Bobas_Raspberry.png"),
	preload("res://assets/items/Bobas_Tropical.png"),
]
var group2 = [
	preload("res://assets/items/Teas_BerryBlast.png"),
	preload("res://assets/items/Teas_EarlGrey.png"),
	preload("res://assets/items/Teas_Matcha.png"),
]
var group3 = [
	preload("res://assets/items/Toppings_Blender.png"),
	preload("res://assets/items/Toppings_Cream.png"),
	preload("res://assets/items/Toppings_Ice.png"),
]

@onready var slots = [$Slot1, $Slot2, $Slot3]

func _ready() -> void:
	print("Setting up thought slots")
	$Slot1.texture = group1.pick_random()
	$Slot2.texture = group2.pick_random()
	$Slot3.texture = group3.pick_random()
		
	var cb = func(slot):
		var tween = create_tween()
		tween.tween_property(slot, "rotation", deg_to_rad(angle), duration).set_trans(Tween.TRANS_SINE)
		tween.tween_property(slot, "rotation", deg_to_rad(-angle), duration).set_trans(Tween.TRANS_SINE)
		tween.set_loops()
	
	for slot in slots:
		var tween = create_tween()
		tween.tween_property(slot, "rotation", deg_to_rad(-angle), duration/2).set_trans(Tween.TRANS_SINE).set_delay(randf_range(0, 2))
		tween.tween_callback(cb.bind(slot))
