extends CanvasLayer

var resources_dict: = Resources.new()
var players: = [[], [], [], []]

signal next

func _ready() -> void:
	for i in range($Separator/PlayerBanner.get_child_count()):
		players[i].resize(resources_dict.size())
		
		var p:int = 0
		for r in range(2, resources_dict.size(), 2):
			players[i][p] = $Separator/PlayerBanner.get_child(i).get_child(r)
			p += 1
	
	reset()

func reset() -> void:
	for player in players:
		for txt in player:
			txt = str(0)


func _on_button_pressed() -> void:
	next.emit()
