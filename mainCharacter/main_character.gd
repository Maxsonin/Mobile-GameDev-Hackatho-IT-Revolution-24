extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var camera_2d = $Camera2D

@export var right_limit: int
@export var bottom_limit: int

const SPEED: int = 100

func _ready():
	camera_2d.limit_right = right_limit 
	camera_2d.limit_bottom = bottom_limit

func _physics_process(delta: float) -> void:
	player_movement(delta)
	
func player_movement(delta: float) -> void:
	animated_sprite_2d.flip_h = false # restarting hlip_h for possible anim change
	if Input.is_action_pressed("Up"):
		velocity = Vector2(0, -SPEED)
		animated_sprite_2d.play("Up")
	elif Input.is_action_pressed("Down"):
		velocity = Vector2(0, SPEED)
		animated_sprite_2d.play("Down")
	elif Input.is_action_pressed("Left"):
		velocity = Vector2(-SPEED, 0)
		animated_sprite_2d.flip_h = true # flipping for the left animation
		animated_sprite_2d.play("Left")
	elif Input.is_action_pressed("Right"):
		velocity = Vector2(SPEED, 0)
		animated_sprite_2d.play("Right")
	else:
		velocity = Vector2(0, 0)
		animated_sprite_2d.play("Idle")
		
	move_and_slide()



func _on_area_2d_body_entered(body):
	if (body.name=="MainCharacter"):
		gameover()
		print("rip")
	pass # Replace with function body.
func gameover():
	animated_sprite_2d.play("rip")
	
