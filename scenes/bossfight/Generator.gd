extends Node

@export var scene: PackedScene
@export var bulava: PackedScene
@onready var timer: Timer = $"../Timer"
@onready var real_boss: Node2D = $"../RealBoss"
@onready var main_character: CharacterBody2D = $"../MainCharacter"

var shots = 0
var dragon_killed = false
var can_shoot = true

signal player_got_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn(global_spawn_position: Vector2, weapon: bool = false, parent: Node = get_tree().current_scene) -> Node:
	if weapon:
		assert(bulava is PackedScene, "Error: The scene export was never set on this spawner component.")
		var instance = bulava.instantiate()
		parent.add_child(instance)
		instance.global_position = global_spawn_position
		instance.connect("hit_character", on_my_lands)
		return instance
	else:
		assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
		var instance = scene.instantiate()
		parent.add_child(instance)
		instance.global_position = global_spawn_position
		instance.connect("hit_character", on_my_lands)
		return instance
	

func on_my_lands():
	player_got_hit.emit()


func _on_timer_timeout() -> void:
	if !dragon_killed:
		spawn(real_boss.position)
		timer.start(1.5 - shots/20)
		shots += 1


func _on_fight_bulava_pressed() -> void:
	if can_shoot:
		spawn(main_character.position, true)
		can_shoot = false
		await get_tree().create_timer(1.0).timeout
		can_shoot = true


func _on_real_boss_dragon_killed() -> void:
	dragon_killed = true
