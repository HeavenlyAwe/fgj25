extends Movable

@export var target: Vector2 = Vector2.ZERO
@export var brain_tween_duration: float = 0.1
@export var brain_timer: float = 3.0
@export var sound_effect: AudioStream
@export var audio_player: AudioStreamPlayer

signal _on_despawn()

var watchable: bool = true

func _ready() -> void:
	$BrainBubble.visible = false
	$BrainBubble.scale = Vector2.ZERO
	
func set_thought(tex1: Texture, tex2: Texture, tex3: Texture) -> void:
	$BrainBubble/ThoughtSlots.set_thought(tex1, tex2, tex3)

func leave_shop(order_score: int) -> void:
	print("Got score: ", order_score)
	if order_score <= 0:
		set_reaction(Reaction.Angry)
	elif order_score == 1:
		set_reaction(Reaction.Sad)
	elif order_score == 2 || order_score == 3:
		set_reaction(Reaction.Happy)
	else:
		set_reaction(Reaction.SuperHappy)
		
	var cb1 = func():
		print("Bye bye!")
		self.queue_free()
		_on_despawn.emit()
	move_to_position(target, cb1)
	
func show_brain() -> void:
	$BrainBubble.visible = true
	var tween = create_tween()
	tween.tween_property($BrainBubble, "scale", Vector2(1, 1), brain_tween_duration)
	if is_instance_valid(audio_player) && is_instance_valid(sound_effect):
		audio_player.stream = sound_effect
		audio_player.play()
		print("play audio")
	var cb = func():
		await get_tree().create_timer(brain_timer).timeout
		hide_brain()
		watchable = false
	tween.tween_callback(cb)
	
func hide_brain() -> void:
	var tween = create_tween()
	tween.tween_property($BrainBubble, "scale", Vector2(0, 0), brain_tween_duration)
	var cb = func():
		$BrainBubble.visible = false
	tween.tween_callback(cb)
	
enum Reaction {
	Angry, Sad, Happy, SuperHappy
}
func set_reaction(reaction: Reaction) -> void:
	if reaction == Reaction.Angry:
		$Reaction/AngryThoughts.visible = true
	elif reaction == Reaction.Happy:
		$Reaction/HappyThoughts.visible = true
	elif reaction == Reaction.Sad:
		$Reaction/SadThoughts.visible = true
	elif reaction == Reaction.SuperHappy:
		$Reaction/SuperHappyThoughts.visible = true

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#leave_shop()
		if watchable:
			show_brain()
		#if $BrainBubble.visible:
			#hide_brain()
		#else:
			#show_brain()
