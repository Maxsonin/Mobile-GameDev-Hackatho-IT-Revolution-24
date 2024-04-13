extends Control

@onready var stone_num_label = %StoneNumLabel
@onready var wood_num_label = %WoodNumLabel
@onready var metal_num_label = %MetalNumLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_stone_value_label(new_value: int):
	stone_num_label.text = str(new_value)
	
func update_wood_value_label(new_value: int):
	wood_num_label.text = str(new_value)
	
func update_metal_value_label(new_value: int):
	metal_num_label.text = str(new_value)
