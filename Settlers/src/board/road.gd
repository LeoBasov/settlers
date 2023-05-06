extends Node2D

@export var dist: float  = 110.0
@export var cost: = {"wood": 0, "wool": 0, "hey": 0, "clay": 0, "stone": 0}

@onready var availible: bool = true
@onready var build: bool = false
@onready var owning_palyer: int = 0
@onready var tiles: Array = []

func change_player(owning_palyer_: int) -> void:
	if not build:
		owning_palyer = owning_palyer_
		
	$RoadSprite2D.modulate = get_tree().get_nodes_in_group("players")[owning_palyer].color

func _on_road_area_2d_mouse_entered() -> void:
	if not build and availible:
		$RoadSprite2D.show()


func _on_road_area_2d_mouse_exited() -> void:
	if not build:
		$RoadSprite2D.hide()
