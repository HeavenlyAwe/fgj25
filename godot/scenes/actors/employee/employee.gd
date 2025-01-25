extends Movable

var mouse_control: bool = false

func _enable_mouse():
	mouse_control = true

func _disable_mouse():
	mouse_control = false

func _init() -> void:
	_on_move_started.connect(_disable_mouse)
	_on_move_completed.connect(_enable_mouse)
	
#func _process(delta: float) -> void:
	#if mouse_control:
		#var mouse_pos = get_global_mouse_position()
		#self.flip_h = (mouse_pos.x - position.x < 0)
	
