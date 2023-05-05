extends Node2D

func _ready() -> void:
	$Board.position = get_viewport().get_visible_rect().size * 0.5
	$GameCamera2D.position = get_viewport().get_visible_rect().size * 0.5

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		reset()

func reset() -> void:
	$GameState.reset()
	$UI.reset()
	$Board.randomize_board()
