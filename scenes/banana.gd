extends Area2D

@onready var game_manager: Node = %GameManager
@onready var sfx: AudioStreamPlayer = $"../SFX"

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		sfx.play()
		game_manager.add_potassium()
		queue_free()
