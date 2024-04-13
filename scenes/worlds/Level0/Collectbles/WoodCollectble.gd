extends Collectable

@onready var resourse_manager = $"../ResourseManager"
@onready var ui = $"../MainCharacter/UI"
@onready var npc = $"../Npc"

func _on_body_entered(body):
	if body.name == "MainCharacter" and npc.activated == true:
		super(body)
		resourse_manager.add_wood()
		update_wood_label()

func update_wood_label():
	ui.update_wood_value_label(resourse_manager.wood)
