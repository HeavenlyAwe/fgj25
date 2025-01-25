extends Sprite2D

var SPEED = 250.0

var move_in = false
var move_out = false

func enter() -> void:
	print("Worker entering")
	move_in = true
	move_out = false

func exit() -> void:
	move_in = false
	move_out = true

func _process(delta: float) -> void:
	if move_in == false && move_out == false:
		var mouse_pos = get_global_mouse_position()
		if mouse_pos.x - position.x < 0:
			scale.x = -1
		else:
			scale.x = 1
			
	if move_in:
		position.x += SPEED * delta;
		
	if move_out:
		position.x -= SPEED * delta;
		
	if position.x > 400:
		move_in = false
	if position.x < -100:
		move_out = false
