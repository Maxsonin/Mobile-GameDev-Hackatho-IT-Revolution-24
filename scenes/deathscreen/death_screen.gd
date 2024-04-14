extends Node2D

var played = false
@onready var scene_trasition: CanvasLayer = $SceneTrasition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene():
	if !played:
		played = true
		#await get_tree().create_timer(1).timeout
		scene_trasition.transition()


func _on_touch_screen_button_pressed() -> void:
	change_scene()


func _on_scene_trasition_transitioned() -> void:
	get_tree().change_scene_to_file("res://scenes/worlds/Level0/Level0.tscn")


func _on_touch_screen_button_2_pressed() -> void:
	get_tree().quit()
