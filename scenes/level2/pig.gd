extends CharacterBody2D

var speed = 100
var player: Node2D = null
var running_away = null

func _physics_process(delta: float) -> void:
	if running_away:
		if ((player.position.x/position.x < 1) or (player.position.y/position.y < 1)):
			speed = 20
		else:
			speed = 100
		position -= (player.position - position)/speed
		if(position.x - player.position.x) < 0:
			$AnimatedSprite2D.play("right")
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.play("right")
			$AnimatedSprite2D.flip_h = false


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	running_away = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	running_away = false


func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("idle")
