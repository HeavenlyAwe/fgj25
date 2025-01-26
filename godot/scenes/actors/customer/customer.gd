extends Movable

@export var target: Vector2 = Vector2.ZERO
@export var brain_tween_duration: float = 0.1
@export var brain_timer: float = 3.0

signal _on_despawn()

var watchable: bool = true

func _ready() -> void:
	$BrainBubble.visible = false
	$BrainBubble.scale = Vector2.ZERO

func leave_shop() -> void:
	var cb1 = func():
		print("Bye bye!")
		self.queue_free()
		_on_despawn.emit()
	move_to_position(target, cb1)
	
func show_brain() -> void:
	$BrainBubble.visible = true
	var tween = create_tween()
	tween.tween_property($BrainBubble, "scale", Vector2(1, 1), brain_tween_duration)
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

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#leave_shop()
		if watchable:
			show_brain()
		#if $BrainBubble.visible:
			#hide_brain()
		#else:
			#show_brain()
