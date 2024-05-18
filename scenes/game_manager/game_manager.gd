extends Node2D

var player1_score: int = 0
var player2_score: int = 0

@onready var ball = $"../Ball"

func _ready():
	pass


func _process(delta):
	pass


func _on_goal_1_area_entered(area) -> void:
	player2_score += 1

	ball.wait_timer()

func _on_goal_2_area_entered(area):
	player1_score += 1

	ball.wait_timer()
