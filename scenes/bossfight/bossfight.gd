extends Node2D
@onready var scene_trasition: CanvasLayer = $SceneTrasition
@onready var main_character: CharacterBody2D = $MainCharacter

var played = false
var victory = false
var player_killed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if main_character.position.x > 300 and victory:
		change_scene()

func change_scene():
	if !played:
		played = true
		await get_tree().create_timer(1).timeout
		scene_trasition.transition()


func _on_generator_player_got_hit() -> void:
	player_killed = true
	change_scene()


func _on_scene_trasition_transitioned() -> void:
	if victory and !player_killed:
		get_tree().change_scene_to_file("res://scenes/mainmenu/main_menu.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/deathscreen/death_screen.tscn")


func _on_real_boss_dragon_killed() -> void:
	victory = true
