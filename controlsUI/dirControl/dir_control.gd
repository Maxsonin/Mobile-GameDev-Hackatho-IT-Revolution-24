extends Control
@onready var top_button = %TopButton
@onready var down_button = %DownButton
@onready var left_button = %LeftButton
@onready var right_button = %RightButton

func _on_top_button_pressed():
	Input.action_release("Down")
	Input.action_release("Left")
	Input.action_release("Right")
	Input.action_press("Up")
	


func _on_down_button_pressed():
	Input.action_release("Left")
	Input.action_release("Right")
	Input.action_release("Up")
	Input.action_press("Down")


func _on_left_button_pressed():
	Input.action_release("Down")
	Input.action_release("Left")
	Input.action_release("Right")
	Input.action_release("Up")
	Input.action_press("Left")


func _on_right_button_pressed():
	Input.action_release("Down")
	Input.action_release("Left")
	Input.action_release("Right")
	Input.action_release("Up")
	Input.action_press("Right")




func _on_top_button_released():
	Input.action_release("Down")
	Input.action_release("Left")
	Input.action_release("Right")
	Input.action_release("Up")

func _on_down_button_released():
	Input.action_release("Down")
	Input.action_release("Left")
	Input.action_release("Right")
	Input.action_release("Up")


func _on_left_button_released():
	Input.action_release("Down")
	Input.action_release("Left")
	Input.action_release("Right")
	Input.action_release("Up")


func _on_right_button_released():
	Input.action_release("Down")
	Input.action_release("Left")
	Input.action_release("Right")
	Input.action_release("Up")
