extends Node2D

func show_report() -> void:
	$Sprite2D.visible = true
	$Score/LongTermChart.visible = true

func hide_report() -> void:
	$Sprite2D.visible = false
	$Score/LongTermChart.visible = false

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var cb = func():
			$Score.restart()
			$"../CustomerSpawner".restart()
			$"../CustomerSpawner".spawn_new_customer()
		$"../Employee".move_to_position($"../FixedAnchors/EmployeeDiscussionPoint".position, cb)
		hide_report()
