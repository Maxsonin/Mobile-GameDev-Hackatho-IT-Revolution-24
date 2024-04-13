extends Timer

@export var stone_scene: PackedScene
var stone_scene = preload("res://scenes/worlds/Level0/Collectbles/stone_collectble.tscn")
const MAX_STONE: int = 10

func _on_timeout():
	randomize()
	var parent: Node = get_tree().current_scene
	var stones = get_tree().get_nodes_in_group("stone")
	var num_stones = stones.size()

	if num_stones < MAX_STONE:
		var resources = [stone_scene]
		var type = resources[randi() % resources.size()]
		var stone = type.instantiate()
		stone.position = Vector2(randi_range(10, 50), randi_range(10, 50))
		parent.add_child(stone)
		stone.add_to_group("stone")
		
	elif num_stones > MAX_STONE:
		var stones_to_remove = num_stones - MAX_STONE
		for i in range(stones_to_remove):
			var stone = stones[i]
			stone.queue_free()

	wait_time = randf_range(0.1, 1.0)
