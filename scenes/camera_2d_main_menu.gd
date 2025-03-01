extends Camera2D

func cameraUpdate():
	var pos = get_local_mouse_position()
	if (pos.x >= -.1 || pos.x <= .1):
		set_position(pos)
		
	if (pos.x < 286):
		$"../CharacterBody2D/Sprite2D".flip_h = true
	else:
		$"../CharacterBody2D/Sprite2D".flip_h = false

func _process(_delta: float) -> void:
	cameraUpdate()
