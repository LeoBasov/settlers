extends Node2D

@export_range(1, 4, 1)
var max_player: int = 4
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
	
	_change_player(player_id)

func _change_player(player_id: int) -> void:
	$UI.change_player(player_id, max_player)
	$Board.change_player(player_id)

func _end_turn() -> void:
	pass

func _on_ui_next() -> void:
	if player_id < (max_player - 1):
		player_id += 1
		_change_player(player_id)
	else:
		player_id = 0
		_change_player(player_id)
		_end_turn()
