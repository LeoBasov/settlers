extends Node2D

func _ready() -> void:
	$Game/UI.hide()

func start() -> void:
	$CanvasLayer.hide()
	$Game.show()
	$Game/UI.show()
	$Game/UI.change_player(0, $Game.max_player)
	$Game/UI.update()

func _on_button_1_player_pressed() -> void:
	$Game.max_player = 1
	start()

func _on_button_2_player_pressed() -> void:
	$Game.max_player = 2
	start()


func _on_button_3_player_pressed() -> void:
	$Game.max_player = 3
	start()


func _on_button_4_players_pressed() -> void:
	$Game.max_player = 4
	start()
