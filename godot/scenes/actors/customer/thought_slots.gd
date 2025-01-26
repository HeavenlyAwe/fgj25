extends Node2D

@export var angle: float = 7.0
@export var duration: float = 1.0

@onready var slots = [$Slot1, $Slot2, $Slot3]

func _ready() -> void:		
	var cb = func(slot):
		var tween = create_tween()
		tween.tween_property(slot, "rotation", deg_to_rad(angle), duration).set_trans(Tween.TRANS_SINE)
		tween.tween_property(slot, "rotation", deg_to_rad(-angle), duration).set_trans(Tween.TRANS_SINE)
		tween.set_loops()
	
	for slot in slots:
		var tween = create_tween()
		tween.tween_property(slot, "rotation", deg_to_rad(-angle), duration/2).set_trans(Tween.TRANS_SINE).set_delay(randf_range(0, 2))
		tween.tween_callback(cb.bind(slot))
		
func set_thought(tex1: Texture, tex2: Texture, tex3: Texture) -> void:
	$Slot1.texture = tex1
	$Slot2.texture = tex2
	$Slot3.texture = tex3
