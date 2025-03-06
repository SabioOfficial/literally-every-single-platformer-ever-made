extends Camera2D

@onready var sprite_2d: AnimatedSprite2D = $"../CharacterBody2D/Sprite2D"

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	await get_tree().create_timer(2.5).timeout
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func cameraUpdate():
	var mousepos = get_local_mouse_position()
	set_position(mousepos)
	
	if (mousepos.x + 286 < $"../CharacterBody2D".position.x): # 286 is the center of the screen.
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false

func _process(_delta: float) -> void:
	cameraUpdate()
