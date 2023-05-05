extends Node2D

var coin_nr: int = 0

func set_type(type: int) -> void:
	$TileSprite.frame = type

func set_coin(nr: int) -> void:
	coin_nr = nr
	$CoinSprite.frame = nr - 2
	$CoinSprite.show()
