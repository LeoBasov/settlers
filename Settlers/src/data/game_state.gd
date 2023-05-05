extends Node

func reset() -> void:
	get_tree().call_group("players", "enter_alert_mode")
