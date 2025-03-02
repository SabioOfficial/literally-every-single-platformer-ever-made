extends Label

@onready var game_manager: Node = %GameManager

func _ready() -> void:
	print(game_manager.time)
