extends Node2D

@onready var build: bool = false
var owning_palyer: int = 0

func change_player(owning_palyer_: int) -> void:
	if not build:
		owning_palyer = owning_palyer_
		
	$BuildingSprite.modulate = get_tree().get_nodes_in_group("players")[owning_palyer].color

func _on_building_area_2d_mouse_entered() -> void:
	pass # Replace with function body.


func _on_building_area_2d_mouse_exited() -> void:
	pass # Replace with function body.
