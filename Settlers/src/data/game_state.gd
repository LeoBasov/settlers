extends Node

var first_round: bool = true

func is_pre_round(max_players: int) -> bool:
	var pre_round: bool = false
	
	for i in range(max_players):
		var player =  $Players.get_child(i)
		pre_round =  pre_round or (player.free_settlement > 0) or (player.free_roads > 0) 
	
	return pre_round

func _ready() -> void:
	reset()

func reset() -> void:
	get_tree().call_group("players", "reset")


func _on_board_modify_state(player_id: int, resource_name: String, value: int) -> void:
	$Players.get_child(player_id).modify_resource(resource_name, value)
