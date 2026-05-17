extends Node2D

var button_type = null
@onready var _1: AudioStreamPlayer = $"1"

func _on_start_pressed() -> void:
	button_type = "start"
	_1.play()
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "start" :
		get_tree().change_scene_to_file("res://scene/game.tscn")
