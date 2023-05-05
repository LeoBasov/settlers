extends Node2D

var build: bool = false
var owning_palyer: int = 0

func _physics_process(delta: float) -> void:
	if not build and Input.is_action_just_pressed("left_click") and $BuildingSprite.visible:
		build = true

func change_player(owning_palyer_: int) -> void:
	if not build:
		owning_palyer = owning_palyer_
		
	$BuildingSprite.modulate = get_tree().get_nodes_in_group("players")[owning_palyer].color

func _on_building_area_2d_mouse_entered() -> void:
	if not build:
		$BuildingSprite.show()


func _on_building_area_2d_mouse_exited() -> void:
	if not build:
		$BuildingSprite.hide()
