extends Node

@onready var actual_task_text: Label = $"../../CanvasLayer/ActualTaskText"
var woodplat_entered: bool = false
var tower_entered: bool = false

func _on_wood_plat_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && woodplat_entered == false):
		woodplat_entered = true
		actual_task_text.text = "Reach the other side of the platforms to invade the tower!"

func _on_tower_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && tower_entered == false):
		tower_entered = true
		actual_task_text.text = "Reach the top of the tower!"
