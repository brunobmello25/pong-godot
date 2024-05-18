extends StaticBody2D

@export var player1: bool
var speed: int = 500


func _process(delta):
	move(delta)
	limit_movement()


func move(delta: float) -> void:
	if player1 and Input.is_action_pressed("player-1-up"):
		position.y -= speed * delta
	elif player1 and Input.is_action_pressed("player-1-down"):
		position.y += speed * delta
	elif !player1 and Input.is_action_pressed("player-2-up"):
			position.y -= speed * delta
	elif !player1 and Input.is_action_pressed("player-2-down"):
		position.y += speed * delta


func limit_movement() -> void:
	position.y = clamp(position.y, 64, 654)
