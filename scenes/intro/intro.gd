extends Node2D

# Define an array to hold references to the nodes you want to cycle through
var slides := []

func _ready():
	# Populate the slides array with references to your nodes
	slides = [
		$"1",
		$"2",
		$"3",
		$"4",
		$"5",
		$"6"
	]
	# Initially, make all nodes invisible
	for slide in slides:
		slide.visible = false
	# Start the slideshow
	start_slideshow()

func start_slideshow():
	# Iterate through the slides
	for i in range(slides.size()):
		# Show the current slide
		slides[i].visible = true
		# Wait for a certain duration before hiding the current slide
		await get_tree().create_timer(2.5).timeout
		# Hide the current slide
		slides[i].visible = false
		if i == 5:
			get_tree().change_scene_to_file("res://scenes/worlds/Level0/Level0.tscn")
