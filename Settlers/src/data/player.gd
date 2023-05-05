extends Node

@export var color: Color = Color.RED
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
