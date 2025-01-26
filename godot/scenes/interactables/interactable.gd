class_name Interactable extends Sprite2D

@export var duration = 3
@export var tween_duration = 0.3
@export var max_scale: Vector2 = Vector2(1.05, 1.05)
@export var normal_scale: Vector2 = Vector2(1.0, 1.0)

signal _on_target_changed(Vector2, Callable)

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", max_scale, tween_duration).set_trans(Tween.TRANS_BOUNCE).set_delay(randf_range(duration, duration + 0.5))
	tween.tween_property(self, "scale", normal_scale, tween_duration).set_trans(Tween.TRANS_BOUNCE)
	tween.set_loops()

func _on_move_complete() -> void:
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_on_target_changed.emit(position, _on_move_complete)
		
