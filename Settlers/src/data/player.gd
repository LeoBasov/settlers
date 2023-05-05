extends Node

@export var color: Color = Color.RED
var resources_dict: = Resources.new()
var resources: Array = []

func _ready() -> void:
	reset()

func reset() -> void:
	resources.resize(resources_dict.size())
	resources.fill(0)
