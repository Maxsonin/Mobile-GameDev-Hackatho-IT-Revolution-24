extends Node2D

func _process(delta: float) -> void:
	if position.x > 350:
		queue_free()

#func _on_area_2d_body_entered(body: Node2D) -> void:
	#print("Weapon - " + body.name)
