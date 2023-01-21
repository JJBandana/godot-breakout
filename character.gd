extends CharacterBody2D

@export var speed: float = 100
@export var size: int = 4

@onready var ball: CharacterBody2D = $Ball

var direction = 0

func _ready():
	set_size(size)

func _physics_process(_delta):
	direction = Input.get_axis("left", "right")
	
	velocity = Vector2(direction * speed, 0)
	
	move_and_slide()


@onready var tilemap = $playerMap

var leftPart = Vector2i(0,0)
var middlePart = Vector2i(1,0)



func set_size(large: int = 3):
	assert(large >= 1, "ERROR: length must be greater than 0")
	tilemap.set_cell(0, Vector2i(0,0), 0, Vector2(0,0), 0)
	
	for i in range(1, large):
		tilemap.set_cell(0, Vector2i(i, 0), 0, Vector2i(1,0), 0)
	
	tilemap.set_cell(0, Vector2i(large, 0), 0, Vector2(0,0), 1)
	
