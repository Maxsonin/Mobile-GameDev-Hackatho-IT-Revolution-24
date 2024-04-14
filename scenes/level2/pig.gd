extends CharacterBody2D

var speed = 19
var player: Node2D = null
var running_away = false
var hit_wall = false
var wall = null

signal pig_left_screen
signal in_stoilo

func _physics_process(delta: float) -> void:
	# 280 127
	if ((position.x > 430 or position.x < -20) or (position.y > 310 or position.y < -10)):
		pig_left_screen.emit()
	if running_away:
		position -= (player.position - position)/speed
		if(position.x - player.position.x) < 0:
			$AnimatedSprite2D.play("right")
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.play("right")
			$AnimatedSprite2D.flip_h = false


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		player = body
		running_away = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.name == "MainCharacter":
		player = null
		running_away = false


func _on_animated_sprite_2d_animation_finished() -> void:
	if(!running_away):
		$AnimatedSprite2D.play("idle")


func _on_walls_colide_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		speed = 6
	else:
		hit_wall = true
		wall = body


func _on_walls_colide_body_exited(body: Node2D) -> void:
	if body.name == "MainCharacter":
		speed = 19


func _on_stoilo_area_body_entered(body: Node2D) -> void:
	if body.name == "Stoilo":
		in_stoilo.emit()
