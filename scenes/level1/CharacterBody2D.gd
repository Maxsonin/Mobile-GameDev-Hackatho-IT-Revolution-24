extends CharacterBody2D
@onready var label=$Label# Called when the node enters the scene tree for the first time.
@onready var b1=$Control/help
@onready var b2=$Control/nothelp
var finish=false
var speedtext=0.15
func _ready():
	b1.visible=false
	b2.visible=false
	$Control/answer.visible=false
	$Control/notanswer.visible=false
	$Control/notanswer2.visible=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!finish):
		if (delta*speedtext+label.visible_ratio>1):
			label.visible_ratio=1
		else:
			label.visible_ratio+=delta*speedtext
		if (label.visible_ratio>=0.95 and label.text=="Привіт! Здається, ти досить кмітливий,
	 можеш допомогти з однією загадкою? 
	Буду вдячний!"):
			b1.visible=true
			b2.visible=true
		if (label.visible_ratio>=0.95 and label.text=="загадка
	\nДавно відомий він тобі:
Коли на сонечку дрімає,
Він колискову сам собі
Під ніс тихесенько співає.
Що в пісні тій – ніхто не зна,
І ми про це тут не напишем.
Ми тільки знаєм, що вона
Не до вподоби мишам!"):
			$Control/answer.visible=true
			$Control/notanswer.visible=true
			$Control/notanswer2.visible=true
		pass

func _on_area_2d_body_entered(body):
	label.visible_ratio=0
	label.text="Привіт! Здається, ти досить кмітливий,
	 можеш допомогти з однією загадкою? 
	Буду вдячний!"
	pass # Replace with function body. 

func _on_help_pressed():
	work()
	b1.visible=false
	b2.visible=false
	pass # Replace with function body.


func _on_nothelp_pressed():
	b1.visible=false
	b2.visible=false
	label.text="нажаль"
	finish=true
	pass # Replace with function body.

func work():
	label.visible_ratio=0
	label.text="загадка
	\nДавно відомий він тобі:
Коли на сонечку дрімає,
Він колискову сам собі
Під ніс тихесенько співає.
Що в пісні тій – ніхто не зна,
І ми про це тут не напишем.
Ми тільки знаєм, що вона
Не до вподоби мишам!"




func _on_answer_pressed():
	Global.karma+=1
	$Control/answer.visible=false
	$Control/notanswer.visible=false
	$Control/notanswer2.visible=false
	label.text="молодець це правильна відповідь
	я всім буду розповідати про твій розум"
	finish=true
	


func _on_notanswer_pressed():
	label.text="нажаль ти не правильно відповів"
	$Control/answer.visible=false
	$Control/notanswer.visible=false
	$Control/notanswer2.visible=false
	finish=true
	

func _on_notanswer_2_pressed():
	label.text="нажаль ти не правильно відповів"
	$Control/answer.visible=false
	$Control/notanswer.visible=false
	$Control/notanswer2.visible=false
	finish=true
