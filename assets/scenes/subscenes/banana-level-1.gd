extends Area2D

@onready var transition = $"../../../UI/SceneTransition"
var newScene = preload("res://assets/scenes/levels/basics.tscn")

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		$"../../../UI/SceneTransition/ColorRect".visible = true
		transition.play("slide_in_from_left")
	else:
		pass

func _on_scene_transition_animation_finished(anim_name) -> void:
	get_tree().change_scene_to_packed(newScene)
