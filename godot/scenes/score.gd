extends Node2D

@export var window_x = Vector2(0, 300)
@export var window_y = Vector2(0, 300)

var current_score = 0

var scores: Array[float]
var day_scores: Array[float]

func _ready() -> void:
	scores.append(0)
	day_scores.append(0)
	
func restart() -> void:
	day_scores.clear()
	day_scores.append(0)

func add_score(score) -> void:
	print("Add score ", score)
	current_score += score
	scores.append(current_score)
	compute_chart(scores, $"LongTermChart/Line2D")
	day_scores.append(current_score)
	compute_chart(day_scores, $"DayChart/Line2D")
	
func compute_chart(scores: Array[float], line: Line2D) -> void:
	if scores.size() < 2:
		return
		
	var x_step = (window_x.y - window_x.x) / (scores.size() - 1)
	
	var min_y = 9999999
	var max_y = -9999999
	for score in scores:
		if score < min_y:
			min_y = score
		if score > max_y:
			max_y = score
			
	var y_step = 0
	if max_y - min_y != 0:
		y_step = (window_y.y - window_y.x) / (max_y - min_y)
	
	#print(x_step, " : ", y_step)
	
	var points: PackedVector2Array
	for i in range(0, scores.size()):
		points.append(Vector2(i * x_step, window_y.y - (scores[i] - min_y) * y_step))
		
	line.points = points
	queue_redraw()
