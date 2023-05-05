extends Node2D

@export var dist: float  = 110.0

@onready var availible: bool = true
@onready var build: bool = false
@onready var owning_palyer: int = 0
@onready var tiles: Array = []

func _physics_process(delta: float) -> void:
	if not build and Input.is_action_just_pressed("left_click") and $BuildingSprite.visible:
		build = true
		get_tree().call_group("buildings", "check_neighbours", position)
		
		for tile in get_tree().get_nodes_in_group("tiles"):
			if (tile.position - position).length() < dist:
				tiles.append(tile)

func change_player(owning_palyer_: int) -> void:
	if not build:
		owning_palyer = owning_palyer_
		
	$BuildingSprite.modulate = get_tree().get_nodes_in_group("players")[owning_palyer].color

func _on_building_area_2d_mouse_entered() -> void:
	if not build and availible:
		$BuildingSprite.show()


func _on_building_area_2d_mouse_exited() -> void:
	if not build:
		$BuildingSprite.hide()

func check_neighbours(pos: Vector2) -> void:
	if not build and availible:
		if (pos - position).length() < dist:
			availible = false
