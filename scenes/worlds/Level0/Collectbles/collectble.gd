class_name Collectable
extends Node2D

@onready var npc = $"../Npc"

func _on_body_entered(body):
	if body.name == "MainCharacter" and npc.done == false:
		queue_free() 
