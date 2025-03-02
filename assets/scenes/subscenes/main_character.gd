extends CharacterBody2D

var stunned = false
var SPEED = 400.0
const JUMP_VELOCITY = -800.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var flip_sfx: AudioStreamPlayer = $"../Orbs/Flip"

func jump():
	velocity.y = JUMP_VELOCITY
	
func knockback(x):
	stunned = true
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta: float) -> void:
	# Animations
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		if stunned == false:
			velocity.x = direction * SPEED
	else:
		if stunned == false:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
	
	if velocity.y == 0:
		stunned = false

func _on_area_2d_5_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		velocity.y = JUMP_VELOCITY
		flip_sfx.play()
