extends Node

var first_round: bool = true

func _ready() -> void:
	reset()

func reset() -> void:
	get_tree().call_group("players", "reset")


func _on_board_modify_state(player_id: int, resource_name: String, value: int) -> void:
	$Players.get_child(player_id).modify_resource(resource_name, value)
