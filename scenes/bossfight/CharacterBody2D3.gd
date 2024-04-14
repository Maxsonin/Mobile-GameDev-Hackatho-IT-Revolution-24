extends CharacterBody2D
@onready var anim=$AnimatedSprite2D
@onready var hero=$"../MainCharacter"
func _ready():
	anim.play("default")
	visible=false
	position=hero.position
	
func _process(delta):
	if !hero.dead:
		if visible==false:
			position=hero.position
		if Input.is_action_pressed("space"):
			visible=true
		if visible==true:
			position.x+=150*delta
		if position.x>290:
			visible=false
