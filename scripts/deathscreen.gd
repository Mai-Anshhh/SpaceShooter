extends Node2D

var button_type = null

func _on_restart_pressed() -> void:
	button_type = "Restart"
	$Timer.start(0.1)


func _on_main_menu_pressed() -> void:
	button_type = "Main Menu"
	$Timer.start(0.1)


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_timer_timeout() -> void:
	if button_type == "Restart" :
		get_tree().change_scene_to_file("res://scene/game.tscn")
	
	if button_type == "Main Menu" :
		get_tree().change_scene_to_file("res://scene/main_menu.tscn")
