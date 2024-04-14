extends Node2D

var speed = 60
var dead = false

signal dragon_killed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !dead:
		position.y+=speed*delta
		if position.y >= 130:
			position.y = 129
			speed=-speed
		if position.y <= 10:
			position.y = 11
			speed=-speed


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "Bulava"):
		dead = true
		dragon_killed.emit()
		
