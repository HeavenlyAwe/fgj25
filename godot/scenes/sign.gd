extends Node2D

@export var angle: float = 3.0
@export var duration: float = 1.0

func _ready() -> void:
	var cb = func():
		var tween = create_tween()
		tween.tween_property(self, "rotation", deg_to_rad(angle), duration).set_trans(Tween.TRANS_SINE)
		tween.tween_property(self, "rotation", deg_to_rad(-angle), duration).set_trans(Tween.TRANS_SINE)
		tween.set_loops()
		
	var tween = create_tween()
	tween.tween_property(self, "rotation", deg_to_rad(-angle), duration/2).set_trans(Tween.TRANS_SINE).set_delay(randf_range(0, 2))
	tween.tween_callback(cb)
