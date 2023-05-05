extends Node2D

var player_id: int = 0
var round_conter: int = 0

func _ready() -> void:
	$Board.position = get_viewport().get_visible_rect().size * 0.5
	$GameCamera2D.position = get_viewport().get_visible_rect().size * 0.5
	reset()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		reset()

func reset() -> void:
	$GameState.reset()
	$UI.reset()
	$Board.randomize_board()
	
	player_id = 0
	round_conter = 0

func change_player(player_id: int) -> void:
	pass

func end_turn() -> void:
	pass
