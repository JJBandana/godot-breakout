extends CharacterBody2D

@export var speed: float = 100

var direction = 0

func _physics_process(_delta):
	direction = Input.get_axis("left", "right")
	
	velocity = Vector2(direction * speed, 0)
	
	move_and_slide()
