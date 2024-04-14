extends Node

@onready var spawn_timer = $SpawnTimer as Timer
@onready var npc = $"../Npc"

@export var stone_scene: PackedScene
@export var wood_scene: PackedScene
@export var metal_scene: PackedScene

@export var left_border: int
@export var right_border: int
@export var top_border: int
@export var bottom_border: int

const MAX_STONE: int = 10
const MAX_WOOD: int = 15
const MAX_METAL: int = 5

func _on_spawn_timer_timeout():
	randomize()
	var parent: Node = get_tree().current_scene

	var stones = get_tree().get_nodes_in_group("stone")
	var num_stones = stones.size()

	var woods = get_tree().get_nodes_in_group("wood")
	var num_woods = woods.size()

	var metals = get_tree().get_nodes_in_group("metal")
	var num_metals = metals.size()
	
	var resources = [stone_scene, wood_scene, metal_scene]
	var type = resources[randi() % resources.size()]

	if type == stone_scene:
		if num_stones < MAX_STONE:
			var stone = type.instantiate()
			stone.position = Vector2(randi_range(right_border, left_border), randi_range(top_border, bottom_border))
			parent.add_child(stone)
			stone.add_to_group("stone")
		elif num_stones > MAX_STONE:
			var stones_to_remove = num_stones - MAX_STONE
			for i in range(stones_to_remove):
				var stone = stones[i]
				stone.queue_free()

	elif type == wood_scene:
		if num_woods < MAX_WOOD:
			var wood = type.instantiate()
			wood.position = Vector2(randi_range(right_border, left_border), randi_range(top_border, bottom_border))
			parent.add_child(wood)
			wood.add_to_group("wood")
		elif num_woods > MAX_WOOD:
			var woods_to_remove = num_woods - MAX_WOOD
			for i in range(woods_to_remove):
				var wood = woods[i]
				wood.queue_free()

	elif type == metal_scene:
		if num_metals < MAX_METAL:
			var metal = type.instantiate()
			metal.position = Vector2(randi_range(right_border, left_border), randi_range(top_border, bottom_border))
			parent.add_child(metal)
			metal.add_to_group("metal")
		elif num_metals > MAX_METAL:
			var metals_to_remove = num_metals - MAX_METAL
			for i in range(metals_to_remove):
				var metal = metals[i]
				metal.queue_free()

	spawn_timer.start()
