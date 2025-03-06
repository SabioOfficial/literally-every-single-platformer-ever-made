extends CharacterBody2D

# Variables
var stunned_from_kb: bool = false
var sneak: bool = false
var stuckUnderObj: bool = false
var SPEED: int = 400.0
const JUMP_VELOCITY: int = -800.0

@onready var crouch_ray_cast_l: RayCast2D = $CrouchRayCastL
@onready var crouch_ray_cast_r: RayCast2D = $CrouchRayCastR
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

# jump function
func jump():
	velocity.y = JUMP_VELOCITY

# knockbacks the player along the x axis.
func knockback(x):
	stunned_from_kb = true # disable the character's movement
	jump() # jump
	velocity.x = x # move backwards with velocity

func crouch():
	sneak = true
	scale.y = 0.6
	position.y += 30
	SPEED = SPEED/2
	var tweenZoom: Tween = create_tween()
	tweenZoom.tween_property($Camera2D, "zoom", Vector2(2,2), .1)
	$Camera2D.position_smoothing_speed = 3.5

func stand():
	sneak = false
	scale.y = 1.2
	SPEED = SPEED*2
	var tweenZoom: Tween = create_tween()
	tweenZoom.tween_property($Camera2D, "zoom", Vector2(1,1), .1)
	$Camera2D.position_smoothing_speed = 7

func ifStandAllowed() -> bool:
	var isAllowed = !crouch_ray_cast_l.is_colliding() && !crouch_ray_cast_r.is_colliding()
	return isAllowed

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
	if Input.is_action_just_pressed("jump") and is_on_floor() and sneak == false:
		jump()
	
	# Handle sneak.
	if Input.is_action_just_pressed("sneak") && (get_tree().current_scene.name != "main_menu.tscn"):
		crouch()
	elif Input.is_action_just_released("sneak"):
		if ifStandAllowed():
			stand()
		else:
			if stuckUnderObj != true:
				stuckUnderObj = true
	
	if stuckUnderObj && ifStandAllowed() && (Input.is_action_pressed("sneak") == false):
		stand()
		stuckUnderObj = false
	
	var direction := Input.get_axis("left", "right")
	if direction && (stunned_from_kb != true):
		velocity.x = direction * SPEED
	elif stunned_from_kb == false:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
	
	if velocity.y == 0:
		stunned_from_kb = false
# Orbs

func _on_area_2d_5_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		velocity.y = JUMP_VELOCITY
		$"../Orbs/Flip".play()
