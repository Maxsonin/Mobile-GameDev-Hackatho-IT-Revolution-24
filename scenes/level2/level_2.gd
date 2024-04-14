extends Node2D

var animations = ["pig_left", "pig_right"]
@onready var pig: CharacterBody2D = $Pig

var anim = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pig_pig_left_screen() -> void:
	if anim:
		anim = false
		$AnimationPlayer.play(animations.pick_random())


func _on_pig_in_stoilo() -> void:
	pig.queue_free()
	$AnimationPlayer.play("pig_caught")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	anim = true
