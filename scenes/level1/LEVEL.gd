extends Node2D

@onready var main_character = $MainCharacter
@onready var scene_trasition = $SceneTrasition

var played: bool = false

func change_scene():
	if !played:
		played = true
		scene_trasition.transition()
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/level2/level_2.tscn")

func _process(delta):
	if main_character.global_position.x >= 305:
			change_scene()
			main_character.visible = false
