extends CharacterBody2D
var speed=60
var damage=false
@onready var fire=$"../CharacterBody2D2"
@onready var anim=$AnimatedSprite2D
@onready var fireanime=$"../CharacterBody2D2/AnimatedSprite2D"
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("walk")
	fire.visible=false
	fire.position=position
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
	if(damage):
		fire.visible=true
		fire.position.x-=150*delta
		fireanime.play("default")
	else:
		fire.visible=false
		fire.position=position
	pass


func attack():
	anim.play("attake")
	damage=false
	speed=0


func _on_animated_sprite_2d_animation_looped():
	if speed ==0:
		anim.play("walk")
		speed=-60*int(position.y>2)+60*int(position.y<2)
		damage=true
	pass # Replace with function body.
