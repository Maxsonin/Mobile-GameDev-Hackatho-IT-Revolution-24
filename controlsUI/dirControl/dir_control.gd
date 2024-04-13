extends Control

@onready var top_button = %TopButton
@onready var down_button = %DownButton
@onready var left_button = %LeftButton
@onready var right_button = %RightButton

func _process(delta: float):
	if top_button.pressed:
		Input.action_press("Up")
	elif down_button.pressed:
		Input.action_press("Down")
	elif left_button.pressed:
		Input.action_press("Left")
	elif right_button.pressed:
		Input.action_press("Right")
