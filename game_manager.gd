extends Node

@onready var points_label: Label = %PointsLabel

var potassiums = 0

var additionalspeed = 10

func add_potassium():
	potassiums += 1
	points_label.text = str(potassiums)
	%CharacterBody2D.SPEED += additionalspeed
