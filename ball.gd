extends CharacterBody2D

class_name Ball

signal out_bounds

var fired : bool = false
@export var speed : float = 100

@export var direction = Vector2(0, -1)

func _physics_process(delta):
	
	if Input.is_action_just_pressed("up"):
		fired = true
	elif not fired:
		return
		
	velocity = direction * speed * speed
	
	var collision_obj = move_and_collide(velocity)
	if collision_obj:
		direction = direction.bounce(collision_obj.get_normal())
		print(str(collision_obj.get_collider()))

func _on_visible_on_screen_notifier_2d_screen_exited():
	fired = false
	emit_signal("out_bounds")
	
