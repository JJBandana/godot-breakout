extends StaticBody2D

signal destroyed

func hit():
	emit_signal("destroyed")
	queue_free()


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_ball_entered(body):
	if body is Ball:
		hit()
