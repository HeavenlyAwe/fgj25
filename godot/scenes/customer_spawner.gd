class_name CustomerSpawner extends Node2D

@export var customerTextures: Array[Texture]

@onready var spawnPoint = $"../FixedAnchors/CustomerSpawnPoint"
@onready var checkoutPoint = $"../FixedAnchors/CustomerCheckoutPoint"
@onready var despawnPoint = $"../FixedAnchors/CustomerDespawnPoint"

@onready var cashRegister = $"../CashRegister"

var customerScene = preload("res://scenes/actors/customer/customer.tscn")

func spawn_new_customer() -> void:
	print("Spawning customer")
	var customer = customerScene.instantiate()
	add_child(customer)
	customer.reparent($"..", false)
	customer.position = spawnPoint.position
	customer.target = despawnPoint.position
	customer._on_despawn.connect(spawn_new_customer)
	cashRegister._on_accept_payment.connect(customer.leave_shop)
	if ! customerTextures.is_empty():
		customer.texture = customerTextures.pick_random()
	#customer.position = spawnPoint
	#print(spawnPoint)
	#print(checkoutPoint)
	#add_child(customer)
	#
	var cb1 = func():
		print("At checkout!")
		print(customer.position)
	print("moving from ", customer.position, " to ", checkoutPoint.position)
	customer.move_to_position(checkoutPoint.position, cb1)

	
