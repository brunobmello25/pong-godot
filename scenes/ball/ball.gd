extends Area2D

var speed: int = 500
var initial_pos: Vector2 = Vector2(640, 360)
var dir: Vector2 = Vector2(0,0)

var max_y = 720
var min_y = 0

@onready var timer: Timer = $Timer

func _ready():
	wait_timer()


func _process(delta):
	move(delta)
	colide()


func pick_direction() -> void:
	var x = [-1, 1].pick_random()
	var y = [-1, 1].pick_random()
	
	dir = Vector2(x, y)


func move(delta: float) -> void:
	position += dir * speed * delta

func wait_timer() -> void:
	timer.start()

func reset() -> void:
	position = initial_pos
	pick_direction()

func colide() -> void:
	if position.y <= min_y or position.y >= max_y:
		dir.y *= -1

func _on_body_entered(body):
	if body.is_in_group("players"):
		dir.x *= -1


func _on_timer_timeout():
	reset()
