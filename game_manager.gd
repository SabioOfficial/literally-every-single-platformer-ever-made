extends Node

@onready var points_label: Label = %PointsLabel
@export var hearts: Array[Node]

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0
var formattedTime: String = ""

var potassiums: int = 0
var lives: int = 3

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(delta) -> void:
	time += delta
	msec = fmod(time, 1) * 1000
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	formattedTime = "%02d:" % minutes + "%02d." % seconds + "%03d" % msec
	$"../CanvasLayer/TimeLabel".text = formattedTime

func _input(InputEvent) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func stop() -> void:
	$"../CanvasLayer/Win".visible = true
	$"../CanvasLayer/Win/VBoxContainer/FinalTime".text = formattedTime
	if (time < 15):
		$"../CanvasLayer/Win/VBoxContainer/FinalTime".text = formattedTime + "  |  SWIFT!"
	elif (time < 20):
		$"../CanvasLayer/Win/VBoxContainer/FinalTime".text = formattedTime + "  |  QUICK!"
	elif (time < 30):
		$"../CanvasLayer/Win/VBoxContainer/FinalTime".text = formattedTime + "  |  FAST!"
	else:
		$"../CanvasLayer/Win/VBoxContainer/FinalTime".text = formattedTime
	var bananas: int = $"../SceneObjects/Collectibles".get_child_count() - 1
	if (bananas == 0):
		$"../CanvasLayer/Win/VBoxContainer/Bananas".text = str(potassiums) + " bananas  |  MAX"
	else:
		$"../CanvasLayer/Win/VBoxContainer/Bananas".text = str(potassiums) + " bananas"
	set_process(false)
	get_tree().paused = true

func decrease_hp():
	lives -= 1
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
	
	if (lives == 0):
		get_tree().reload_current_scene()

func add_potassium():
	potassiums += 1
	points_label.text = str(potassiums)
	%CharacterBody2D.SPEED += 10
