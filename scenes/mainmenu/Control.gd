extends Control

func _on_touch_screen_button_pressed():
	get_tree().change_scene_to_file("res://scenes/intro/intro.tscn")
