extends Node

@onready var actual_task_text: Label = $"../../CanvasLayer/ActualTaskText"
var enemy_entered: bool = false
var basement_entered: bool = false
var tight_entered: bool = false
var platforms2_entered: bool = false

func _on_enemy_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && enemy_entered == false):
		enemy_entered = true
		actual_task_text.text = "You shouldn't have invaded the tower."

func _on_tower_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && basement_entered == false):
		basement_entered = true
		actual_task_text.text = "Explore the b̵̩̑̄a̷̳̍s̶̙̪̾͘e̸͍̐͆m̵̯͔̀̌e̶̪͌͝ñ̸̗̋ț̴͚́̿."

func _on_tight_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && tight_entered == false):
		tight_entered = true
		actual_task_text.text = "Tight tunnels ahead. Don't get caught."


func _on_platforms_2_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D" && platforms2_entered == false):
		platforms2_entered = true
		actual_task_text.text = "Jump over the platforms!"
