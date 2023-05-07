extends Node

@export var color: Color = Color.RED
@export var free_settlement: int = 2
@export var free_roads: int = 2

var resources_dict: = Resources.new()
var resources: Array = []

func _ready() -> void:
	reset()

func reset() -> void:
	resources.resize(resources_dict.size())
	resources.fill(0)

func modify_resource(resource_name: String, value: int) -> void:
	var key: int = resources_dict.word2num(resource_name)
	resources[key] += value
	clamp(resources[key], 0, 99)

func modify_resources(resources_names: Array[String], values: Array[int]) -> void:
	assert(resources_names.size() == values.size())
	for i in range(len(resources_names)):
		modify_resource(resources_names[i], values[i])

func modify_resources_dict(resource_dict: Dictionary) -> void:
	for key in resource_dict.keys():
		modify_resource(key, -resource_dict[key])
