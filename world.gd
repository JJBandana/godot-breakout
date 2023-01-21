extends Node2D

@onready var ball = $Ball
@onready var player_marker = $Character/Marker2D
@onready var lifes = $Lifes/TextureProgressBar
@onready var game_over_label = $"Game Over"
@onready var replay_button = $"Game Over/VBoxContainer/Button"
@onready var score_label = $"Game Over/Score"
@onready var game_over_box = $"Game Over/VBoxContainer"

var lives: int = 3
var score: int = 0 : set = setScore

func setScore(new_score):
	score = new_score
	score_label.text = str("SCORE: ", score)

func _ready():
	replay_button.pressed.connect(_on_replay_pressed)
	game_over_box.visible = false

func _on_replay_pressed():
	get_tree().reload_current_scene()

func game_over():
	game_over_label.visible = true
	game_over_box.visible = true
	$Lifes.visible = false

func _on_ball_out_bounds():
	lives -= 1
	if lives > 0:
		lifes.value = lives
		ball.position = Vector2(80, 117)
	else:
		game_over()
