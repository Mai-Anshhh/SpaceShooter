extends Area2D

@onready var timer: Timer = $Timer
@onready var explode_1: AudioStreamPlayer = $Explode1

func _on_body_entered(_body):
	explode_1.play()
	print("you died")
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scene/deathscreen.tscn")
