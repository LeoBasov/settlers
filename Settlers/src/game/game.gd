extends Node2D

func _ready() -> void:
	$Board.position = get_viewport().get_visible_rect().size * 0.5
