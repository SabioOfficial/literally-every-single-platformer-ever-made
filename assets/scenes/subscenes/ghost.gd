extends CharacterBody2D

@onready var game_manager: Node = %GameManager

# func _process(delta: float) -> void:
	#

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

var is_moving_left = true

var gravity =  10 # check https://www.youtube.com/watch?v=jQKxOEbbirA for more detail

var speed = 32 # pixels per second

func _process(_delta):
	move_character()
	detect_turn_around()
		
func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y += gravity
	
	move_and_slide()

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x
