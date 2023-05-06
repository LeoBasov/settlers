extends Node2D

var Tile: = preload("res://src/board/tile.tscn")
var Building: = preload("res://src/board/building.tscn")
var recources_dict: = Resources.new()
var current_player: int = 0

signal modify_state(player_id: int, recourse: String, value: int)
signal update_ui

func _ready() -> void:
	$HexGrid.build(2)
	set_up_buildings()
	randomize_board()
	
func get_score(dice: int, first_round: bool) -> void:
	for building in $Buildings.get_children():
		if building.build:
			for tile in building.tiles:
				if first_round or tile.coin_nr == dice:
					modify_state.emit(building.owning_palyer, tile.get_type(), 1)

func randomize_board() -> void:
	for child in $Tiles.get_children():
		child.queue_free()
	
	var tiles: Array[int] = set_up_rand_tiles({"wood": 4, "wool": 4, "hey": 4, "clay": 3, "stone": 3})
	var coins: Array[int] = [2, 3, 3, 4, 4, 5, 5, 6, 6, 8, 8, 9, 9, 10, 10, 11, 11, 12]
	var j: int  = 0
	
	randomize()
	coins.shuffle()
	
	for i in range(len($HexGrid.get_cells())):
		var cell = $HexGrid.get_cells()[i]
		var tile: = Tile.instantiate()
		tile.set_type(tiles[i])
		tile.position = cell.position
		if tiles[i] != 5:
			tile.set_coin(coins[j])
			j += 1
		$Tiles.add_child(tile)

func set_up_buildings() -> void:
	for child in $Buildings.get_children():
		child.queue_free()
		
	for vertex in $HexGrid.get_vertices():
		var building: = Building.instantiate()
		building.position = vertex.position
		building.update_ui.connect(_on_update_ui)
		$Buildings.add_child(building)

func set_up_rand_tiles(dict: Dictionary) -> Array[int]:
	var tiles: Array[int] = []
	
	for key in dict.keys():
		for i in range(dict[key]):
			tiles.append(recources_dict.word2num(key))
			
	tiles.append(5)
	randomize()
	tiles.shuffle()
	
	return tiles

func change_player(current_palyer_: int) -> void:
	current_player = current_palyer_

	for building in $Buildings.get_children():
		building.change_player(current_player)

func _on_update_ui() -> void:
	update_ui.emit()
