class_name Collectable
extends Node2D

func _on_body_entered(body):
	if body.name == "MainCharacter":
		queue_free() 
