extends CharacterBody2D

const SPEED: int = 100

func _physics_process(delta: float) -> void:
	player_movement(delta)
	
func player_movement(delta: float) -> void:
	if Input.is_action_pressed("Up"):
		velocity = Vector2(0, -SPEED)
	elif Input.is_action_pressed("Down"):
		velocity = Vector2(0, SPEED)
	elif Input.is_action_pressed("Left"):
		velocity = Vector2(-SPEED, 0)
	elif Input.is_action_pressed("Right"):
		velocity = Vector2(SPEED, 0)
	else:
		velocity = Vector2(0, 0)
		
	move_and_slide()
