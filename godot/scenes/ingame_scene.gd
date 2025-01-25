extends Node2D

@onready var fade_overlay = %FadeOverlay
@onready var pause_overlay = %PauseOverlay

@onready var placeholder = $ClickableItem
@onready var worker = $Worker
@onready var manager = $Manager

func _ready() -> void:
	fade_overlay.visible = true
	
	if SaveGame.has_save():
		SaveGame.load_game(get_tree())
	
	pause_overlay.game_exited.connect(_save_game)
	$IntroAnimator.start()

func _input(event) -> void:
	if event.is_action_pressed("pause") and not pause_overlay.visible:
		get_viewport().set_input_as_handled()
		get_tree().paused = true
		pause_overlay.grab_button_focus()
		pause_overlay.visible = true
	
	#
	#if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#var callback = func():
			#print("I have arrived!")
		#$Worker/Node2D2.move_to_position(get_global_mouse_position(), callback)
		
func _save_game() -> void:
	SaveGame.save_game(get_tree())
