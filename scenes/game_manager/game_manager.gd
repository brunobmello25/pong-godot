extends Node2D

var player1_score: int = 0
var player2_score: int = 0

@onready var ball = $"../Ball"
@onready var p1_score_label = $"../UI/ScorePanel/P1Score"
@onready var p2_score_label = $"../UI/ScorePanel/P2Score"

func _ready():
	pass


func _process(delta):
	pass

func update_scores() -> void:
	p1_score_label.set_text(str(player1_score))
	p2_score_label.set_text(str(player2_score))
	
func _on_goal_1_area_entered(area) -> void:
	player2_score += 1
	update_scores()
	ball.wait_timer()

func _on_goal_2_area_entered(area):
	player1_score += 1
	update_scores()
	ball.wait_timer()
