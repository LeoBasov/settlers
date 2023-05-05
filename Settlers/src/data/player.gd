extends Node

@export var color: Color = Color.RED
var resources_dict: = Resources.new()
var resources: Array = []

func _ready() -> void:
	reset()

func reset() -> void:
	resources.resize(resources_dict.size())
	resources.fill(0)

func modify_resource(resource: String, value: int) -> void:
	var key: int = resources[resources_dict.word2num(resource)]
	resources[key] += value
	clamp(resources[key], 0, 99)

func modify_resources(resources: Array[String], values: Array[int]) -> void:
	assert(resources.size() == values.size())
	for i in range(len(resources)):
		modify_resource(resources[i], values[i])
