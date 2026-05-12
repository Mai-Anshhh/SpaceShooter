extends Node2D

var enemy1 = preload("res://scene/enemy1.tscn")
var enemy2 = preload("res://scene/enemy2.tscn")
var enemy3 = preload("res://scene/enemy3.tscn")
var score = 0

func _ready():
	$Fade_transition/AnimationPlayer.play("fade_out")
	$Timer.start(2.0)
	$Timer2.start(5.0)
	$Timer3.start(60.0)

func _on_timer_timeout() -> void:
	var inst = enemy1.instantiate()
	add_child(inst)
	inst.connect("enemy_die",_on_enemy1_die)
	$Timer.start(randi() % 4)

func _on_timer_2_timeout() -> void:
	var inst = enemy2.instantiate()
	add_child(inst)
	inst.connect("enemy_die",_on_enemy2_die)
	$Timer.start(randi() % 4)

func _on_timer_3_timeout() -> void:
	var inst = enemy3.instantiate()
	add_child(inst)
	inst.connect("enemy_die",_on_enemy3_die)
	$Timer.start(randi() % 4)

func _on_enemy1_die():
	score += 1
	print("+1")
	$CanvasLayer/score.text = "score : " + str(score)

func _on_enemy2_die():
	score += 2
	print("+2")
	$CanvasLayer/score.text = "score : " + str(score)

func _on_enemy3_die():
	score += 5
	print("+5")
	$CanvasLayer/score.text = "score : " + str(score)


func _on_player_player_hit(value: Variant) -> void:
	$CanvasLayer/life.text = "Lives : " + str(value)
