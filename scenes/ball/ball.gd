extends Area2D

var initial_speed: int = 500
var speed: int = initial_speed
var initial_pos: Vector2 = Vector2(640, 360)
var dir: Vector2 = Vector2(0,0)

var max_y = 720
var min_y = 0
var min_x = 0
var max_x = 1280

@onready var timer: Timer = $Timer
@onready var player_hit_sound = $PlayerHitSound
@onready var wall_hit_sound = $WallHitSound

func _ready():
	wait_timer()


func _process(delta):
	move(delta)
	colide_wall()


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
	speed = initial_speed

func colide_wall() -> void:
	if position.y <= min_y or position.y >= max_y:
		dir.y *= -1
		if position.x >= min_x and position.x <= max_x:
			wall_hit_sound.play()

func _on_body_entered(body):
	if body.is_in_group("players"):
		dir.x *= -1
		player_hit_sound.play()

func _on_timer_timeout():
	reset()
