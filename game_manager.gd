extends Node

@onready var points_label: Label = %PointsLabel

var potassiums = 0

var additionalspeed = 10

func _ready() -> void:
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/level-3-start.dialogue"), "start")
	return

func add_potassium():
	potassiums += 1
	print(potassiums)
	points_label.text = str(potassiums)
	%CharacterBody2D.SPEED += additionalspeed
