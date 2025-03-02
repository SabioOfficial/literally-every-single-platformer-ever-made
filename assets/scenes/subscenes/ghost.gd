extends CharacterBody2D

var dead = false
@onready var game_manager: Node = %GameManager

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if (y_delta > 50 && dead == false):
			$AnimatedSprite2D.animation = "dead" # Chasnge Animation to Death
			body.jump() # Player Jumps
			$CollisionShape2D.queue_free()
			dead = true
			var fadeOut = create_tween()
			await fadeOut.tween_property($AnimatedSprite2D, "modulate:a", 1, 1).finished  # Wait Until Animation Finishes
			queue_free()
		else:
			if dead == false:
				game_manager.decrease_hp()
				if (x_delta > 0):
					body.knockback(300)
				else:
					body.knockback(-300)

var is_moving_left = true

var gravity = 10

var speed = 32 # In PX

func _process(_delta):
	if dead == false:
		move_character()
		detect_turn_around()
		detect_player()
		
func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y += gravity
	
	move_and_slide()

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x

func detect_player():
	if $RunCast2D.is_colliding():
		$Detected.visible = true
		$AnimatedSprite2D.speed_scale = 32 * 3
		speed = 96
	else:
		$Detected.visible = false
		$AnimatedSprite2D.speed_scale = 1
		speed = 32
