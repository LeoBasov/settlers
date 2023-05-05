extends Node

func _ready() -> void:
	reset()

func reset() -> void:
	get_tree().call_group("players", "reset")
