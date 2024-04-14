extends Collectable

@onready var resourse_manager = $"../ResourseManager"
@onready var ui = $"../MainCharacter/UI"
#@onready var npc = $"../Npc"

func _on_body_entered(body):
	if body.name == "MainCharacter" and npc.activated == true:
		super(body)
		resourse_manager.add_metal()
		update_metal_label()

func update_metal_label():
	ui.update_metal_value_label(resourse_manager.metal)
