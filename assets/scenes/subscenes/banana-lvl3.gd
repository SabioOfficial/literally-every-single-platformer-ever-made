extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		get_tree().change_scene_to_file("res://assets/scenes/levels/level-3.tscn")
	else:
		pass
