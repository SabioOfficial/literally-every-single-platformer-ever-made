extends RigidBody2D

@onready var game_manager: Node = %GameManager

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if (y_delta > 50):
			queue_free()
			body.jump()
		else:
			game_manager.decrease_hp()
			if (x_delta > 0):
				body.knockback(500)
			else:
				body.knockback(-500)
