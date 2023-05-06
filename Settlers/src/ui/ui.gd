extends CanvasLayer

var resources_dict: = Resources.new()
var players: = [[], [], [], []]
var current_player: int = 0
var may_player_nr: int = 0

var game_state

signal next

func set_dice(value: int) -> void:
	$Bottons/DiceValue.text = str(value)
	
func update():
	for i in range(may_player_nr, len(players)):
		$Separator/PlayerBanner.get_child(i).hide()
	
	for i in range(len(players)):
		for r in range(len(players[i])):
			players[i][r].text = str(game_state.get_child(0).get_child(i).resources[r])

func _ready() -> void:
	for i in range($Separator/PlayerBanner.get_child_count()):
		players[i].resize(resources_dict.size())
		
		var p:int = 0
		for r in range(2, $Separator/PlayerBanner.get_child(i).get_children().size(), 2):
			players[i][p] = $Separator/PlayerBanner.get_child(i).get_child(r)
			p += 1
	
	reset()

func reset() -> void:
	set_dice(0)
	
	for player in players:
		for txt in player:
			txt = str(0)


func _on_button_pressed() -> void:
	next.emit()

func change_player(player: int, may_player_nr_: int) -> void:
	current_player = player
	may_player_nr = may_player_nr_
	$Separator/CurrentPlayer.text = str(current_player + 1)
	$Separator/TotalPlayer.text = str(may_player_nr)

	if current_player + 1 == may_player_nr:
		$Bottons/Button.text = "Next Round"
	else:
		$Bottons/Button.text = "Next Player"
