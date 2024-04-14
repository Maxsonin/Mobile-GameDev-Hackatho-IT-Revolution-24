extends Node2D

var animations = ["pig_left", "pig_right"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pig_pig_left_screen() -> void:
	$AnimationPlayer.play("pig_left")
