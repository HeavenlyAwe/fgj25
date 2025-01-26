class_name CustomerSpawner extends Node2D

@export var customerTextures: Array[Texture]

@onready var spawnPoint = $"../FixedAnchors/CustomerSpawnPoint"
@onready var checkoutPoint = $"../FixedAnchors/CustomerCheckoutPoint"
@onready var despawnPoint = $"../FixedAnchors/CustomerDespawnPoint"

@onready var cashRegister = $"../CashRegister"

@onready var thought_group_1 = [
	$"../Ingredients_Background/Ingredient_Teas_BerryBlast",
	$"../Ingredients_Background/Ingredient_Teas_EarlGrey",
	$"../Ingredients_Background/Ingredient_Teas_Matcha",
]
@onready var thought_group_2 = [
	$"../Ingredients_Background/Ingredient_Toppings_Ice",
	$"../Ingredients_Background/Ingredient_Toppings_Cream",
	$"../Ingredients_Background/Ingredient_Toppings_Blender",
]
@onready var thought_group_3 = [
	$"../Ingredients_Foreground/Ingredient_Bobas_Raspberry",
	$"../Ingredients_Foreground/Ingredient_Bobas_BrownSugar",
	$"../Ingredients_Foreground/Ingredient_Toppings_Tropical",
]

var customerScene = preload("res://scenes/actors/customer/customer.tscn")

var current_thought1: Texture
var current_thought2: Texture
var current_thought3: Texture

var current_order: Array[Texture]

func score_thought(tex1: Texture) -> void:
	if tex1 in current_order:
		$"../Score".add_score(1)
		current_order.erase(tex1)
	else:
		$"../Score".add_score(-1)
	print("Score: ", $"../Score".current_score)

func spawn_new_customer() -> void:
	print("Spawning customer")
	var customer = customerScene.instantiate()
	add_child(customer)
	customer.reparent($"..", false)
	customer.position = spawnPoint.position
	customer.target = despawnPoint.position
	customer._on_despawn.connect(spawn_new_customer)
	if ! customerTextures.is_empty():
		customer.texture = customerTextures.pick_random()

	current_thought1 = thought_group_1.pick_random().texture
	current_thought2 = thought_group_2.pick_random().texture
	current_thought3 = thought_group_3.pick_random().texture
	
	customer.set_thought(
		current_thought1,
		current_thought2,
		current_thought3
	)
	
	current_order = [current_thought1, current_thought2, current_thought3]
	
	cashRegister._on_accept_payment.connect(customer.leave_shop)
	
	var cb1 = func():
		print("At checkout!")
		print(customer.position)
	print("moving from ", customer.position, " to ", checkoutPoint.position)
	customer.move_to_position(checkoutPoint.position, cb1)

	
