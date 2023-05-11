extends Node2D

@export var dist: float  = 110.0
@export var settlement_cost: = {"wood": 0, "wool": 0, "hey": 0, "clay": 0, "stone": 0}
@export var city_cost: = {"wood": 0, "wool": 0, "hey": 0, "clay": 0, "stone": 0}

@onready var availible: bool = true
@onready var build: bool = false
@onready var owning_palyer: int = 0
@onready var tiles: Array = []

var resources_dict: = Resources.new()

signal update_ui

func _physics_process(_delta: float) -> void:
	if check_cost() and not build and Input.is_action_just_pressed("left_click") and $SettlementSprite.visible:
		build = true
		pay()
		get_tree().call_group("buildings", "check_neighbours", position)
		
		for tile in get_tree().get_nodes_in_group("tiles"):
			if (tile.position - position).length() < dist:
				tiles.append(tile)
				
		update_ui.emit()

func change_player(owning_palyer_: int) -> void:
	if not build:
		owning_palyer = owning_palyer_
		
	$SettlementSprite.modulate = get_tree().get_nodes_in_group("players")[owning_palyer].color

func _on_building_area_2d_mouse_entered() -> void:
	if not build and availible:
		$SettlementSprite.show()


func _on_building_area_2d_mouse_exited() -> void:
	if not build:
		$SettlementSprite.hide()

func check_neighbours(pos: Vector2) -> void:
	if not build and availible:
		if (pos - position).length() < dist:
			availible = false

func check_cost() -> bool:
	var player = get_tree().get_nodes_in_group("players")[owning_palyer]
	var plr_res = player.resources
	var valid: bool = true
	
	if player.free_settlement > 0:
		return true
		
	for key in settlement_cost.keys():
		var id: int = resources_dict.word2num(key)
		valid =  valid and (plr_res[id] >= settlement_cost[key])

	return valid

func pay() -> void:
	var player = get_tree().get_nodes_in_group("players")[owning_palyer]
	
	if player.free_settlement > 0:
		player.free_settlement -= 1
	else:
		player.modify_resources_dict(settlement_cost)
