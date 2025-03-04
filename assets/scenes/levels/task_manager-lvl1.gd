extends Node

@onready var actual_task_text: Label = $"../../CanvasLayer/ActualTaskText"
var stairs_entered = false
var platforms_entered = false
var banana_entered = false
var timing_entered = false

func _on_stairs_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && stairs_entered == false):
		stairs_entered = true
		actual_task_text.text = "Get the banana!"

func _on_platforms_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && platforms_entered == false):
		platforms_entered = true
		actual_task_text.text = "Don't fall off- or you'll have to restart the level!"

func _on_banana_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && banana_entered == false):
		banana_entered = true
		actual_task_text.text = "Collect all em' bananas! They make you go faaaast!"

func _on_timing_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && timing_entered == false):
		timing_entered = true
		actual_task_text.text = "Time your jump correctly or you DIE!"
