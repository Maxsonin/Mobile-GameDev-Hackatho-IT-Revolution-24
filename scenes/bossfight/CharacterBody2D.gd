extends CharacterBody2D
var speed=30
@onready var anim=$AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y+=speed*delta
	if position.y>=110:
		position.y=109
		attack()
		speed=-speed
	if position.y<=0:
		position.y=1
		speed=-speed
		attack()
	anim.play("walk")
	pass


func attack():
	print(speed)
	anim.play("attake")
	speed=0


func _on_animated_sprite_2d_animation_finished():
	if position.y==109:
		speed=-30
	else:
		speed=30
	pass # Replace with function body.
