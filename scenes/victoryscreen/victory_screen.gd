extends Node2D

@onready var label_3: Label = $Label3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.karma == 2:
		label_3.text = "Я чув, що чи добрий і мудрий,
		 я дуже радий за це"
	else:
		label_3.text = "Я не чув, щоб ти був видатним...
		 Можливо в наступний раз..." 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().quit()
