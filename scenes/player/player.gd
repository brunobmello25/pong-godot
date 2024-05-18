extends StaticBody2D

@export var player1: bool
var speed: int = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
