extends Node2D

var recource_dict = Resources.new()
var coin_nr: int = 0

func set_type(type: int) -> void:
	$TileSprite.frame = type
	
func get_type() -> String:
	return recource_dict.num2word($TileSprite.frame)

func set_coin(nr: int) -> void:
	coin_nr = nr
	$CoinSprite.frame = nr - 2
	$CoinSprite.show()
