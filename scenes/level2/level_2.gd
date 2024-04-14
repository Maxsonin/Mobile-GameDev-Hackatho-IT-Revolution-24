extends Node2D

var animations = ["pig_left", "pig_right"]
@onready var pig: CharacterBody2D = $Pig
@onready var scene_trasition: CanvasLayer = $SceneTrasition
@onready var main_character: CharacterBody2D = $MainCharacter

var anim = true
var played: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func change_scene():
	if !played:
		played = true
		scene_trasition.transition()
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/bossfight/bossfight.tscn")
		
func _process(delta):
	if main_character.global_position.x >= 430:
			change_scene()
			main_character.visible = false



func _on_pig_pig_left_screen() -> void:
	if anim:
		anim = false
		$AnimationPlayer.play(animations.pick_random())


func _on_pig_in_stoilo() -> void:
	Global.karma += 1
	pig.queue_free()
	$AnimationPlayer.play("pig_caught")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	anim = true
