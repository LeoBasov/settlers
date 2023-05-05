extends Node

@export var color: Color = Color.RED
var resources_dict: = Resources.new()
var resources: Array = []

func _ready() -> void:
	resources.resize(5)
	resources.fill(0)
