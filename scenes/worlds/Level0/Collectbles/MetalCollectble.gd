extends Collectable

@onready var resourse_manager = $"../ResourseManager"
@onready var ui = $"../MainCharacter/UI"

func _on_body_entered(body):
	super(body)
	resourse_manager.add_metal()
	update_metal_label()

func update_metal_label():
	ui.update_metal_value_label(resourse_manager.metal)
