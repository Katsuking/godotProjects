extends Node

# save builtin godot
const SAVE_PATH = "users://savegame.bin"
const RES_PATH = "res://savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE) # create file
	if file == null:
		file = FileAccess.open(RES_PATH, FileAccess.WRITE) # create file

	var data = {
		"playerHP": Game.playerHP,
		"Gold": Game.Gold,
	}
	var json = JSON.stringify(data)
	file.store_line(json)

func loadGame():
	if FileAccess.open((SAVE_PATH), FileAccess.READ) or FileAccess.open((SAVE_PATH), FileAccess.READ): 
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ) # read file
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.playerHP = current_line["playerHP"]
				Game.Gold = current_line["Gold"]				

