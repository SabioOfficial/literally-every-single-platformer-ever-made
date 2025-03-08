extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var newScene = load("res://assets/scenes/levels/level-2.tscn")
		get_tree().change_scene_to_file(newScene)
	else:
		pass
