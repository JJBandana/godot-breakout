extends Node2D

@onready var ball = $Ball
@onready var player_marker = $Player/Marker2D

var lives: int = 3
var score: int = 0

func _on_ball_out_bounds():
	lives -= 1
	print(lives)
	ball.position = Vector2(80, 117)
