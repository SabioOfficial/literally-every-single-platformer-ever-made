extends Node

@onready var actual_task_text: Label = $"../../CanvasLayer/ActualTaskText"
var ueahs_entered: bool = false
var ueahsedge_entered: bool = false
var banana_entered: bool = false
var timing_entered: bool = false

func _on_ueahs_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && ueahs_entered == false):
		ueahs_entered = true
		actual_task_text.text = "You can fit into 2 tile gaps! These obstacles are called 'Ueahs'!"

func _on_ueahsedge_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && ueahsedge_entered == false):
		ueahsedge_entered = true
		actual_task_text.text = "Stand on the edge of the Ueahs and try jumping to the next Ueah!"

func _on_banana_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && banana_entered == false):
		banana_entered = true
		actual_task_text.text = "Collect all em' bananas! They make you go faaaast!"

func _on_timing_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && timing_entered == false):
		timing_entered = true
		actual_task_text.text = "Time your jump correctly or you DIE!"
