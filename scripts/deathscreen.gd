extends Node2D

var button_type = null
@onready var _1: AudioStreamPlayer = $"1"
@onready var _7: AudioStreamPlayer = $"7"

func _ready() -> void:
	Global.load_highscore()
	update_ui()


func _on_restart_pressed() -> void:
	button_type = "Restart"
	$Timer.start(0.1)
	_1.play()


func _on_main_menu_pressed() -> void:
	button_type = "Main Menu"
	$Timer.start(0.1)
	_7.play()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_timer_timeout() -> void:
	if button_type == "Restart" :
		get_tree().change_scene_to_file("res://scene/game.tscn")
	
	if button_type == "Main Menu" :
		get_tree().change_scene_to_file("res://scene/main_menu.tscn")
		

func update_ui():
	$Highscore.text = "Best: " + str(Global.highscore)
