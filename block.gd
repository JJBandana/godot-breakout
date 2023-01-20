extends StaticBody2D

signal destroyed

@onready var world = get_parent().get_parent()

func hit():
	emit_signal("destroyed")
	world.score += 1
	queue_free()
	


func _on_area_2d_ball_entered(body):
	if body is Ball:
		hit()
