extends Node2D

var Tile: = preload("res://src/board/tile.tscn")
var recources_dict: = Resources.new()

func _ready() -> void:
	$HexGrid.build(2)
	randomize_board()

func randomize_board() -> void:
	var tiles: Array[int] = []
	
	for cell in $HexGrid.get_cells():
		var tile: = Tile.instantiate()
		tile.position = cell.position
		$Tiles.add_child(tile)
