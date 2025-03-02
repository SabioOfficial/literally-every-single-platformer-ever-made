extends CharacterBody2D

# Variables
var stunned = false
var SPEED = 400.0
const JUMP_VELOCITY = -800.0

# sprite_2d
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

# jump function
func jump():
	velocity.y = JUMP_VELOCITY

# knockbacks the player along the x axis.
func knockback(x):
	stunned = true # disable the character's movement
	jump() # jump
	velocity.x = x # move backwards with velocity

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
		jump()

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
		if $"../Orbs/Flip":
			$"../Orbs/Flip".play()
