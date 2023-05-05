extends Node2D

var Tile: = preload("res://src/board/tile.tscn")
var Building: = preload("res://src/board/building.tscn")
var recources_dict: = Resources.new()
var current_player: int = 0

func _ready() -> void:
	$HexGrid.build(2)
	set_up_buildings()
	randomize_board()

func randomize_board() -> void:
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
