extends Node2D

@export var dist: float  = 110.0
@export var cost: = {"wood": 0, "wool": 0, "hey": 0, "clay": 0, "stone": 0}

@onready var availible: bool = false
@onready var build: bool = false
@onready var owning_palyer: int = 0
@onready var tiles: Array = []

var resources_dict: = Resources.new()

signal update_ui

func _physics_process(_delta: float) -> void:
	if check_cost() and not build and Input.is_action_just_pressed("left_click") and $RoadSprite2D.visible:
		build = true
		pay()
		update_ui.emit()

func check_neighbours() -> void:
	if not build:
		for building in get_tree().get_nodes_in_group("buildings"):
			if building.build and (building.owning_palyer == owning_palyer) and (building.position - position).length() < dist*0.5:
				availible = true
				return

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

func check_cost() -> bool:
	var player = get_tree().get_nodes_in_group("players")[owning_palyer]
	var plr_res = player.resources
	var valid: bool = true
	
	if player.free_settlement > 0:
		return true
		
	for key in cost.keys():
		var id: int = resources_dict.word2num(key)
		valid =  valid and (plr_res[id] >= cost[key])

	return valid

func pay() -> void:
	var player = get_tree().get_nodes_in_group("players")[owning_palyer]
	
	if player.free_settlement > 0:
		player.free_settlement -= 1
	else:
		player.modify_resources_dict(cost)
