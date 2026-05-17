extends Node

var score = 0
var highscore = 0
const SAVE_PATH = "user://highscore.save"

func save_highscore():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(highscore)
	file.close()

func load_highscore():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		highscore = file.get_var()
		file.close()
