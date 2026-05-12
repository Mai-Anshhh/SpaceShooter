extends CharacterBody2D

var fireball = preload("res://scene/fireball.tscn")

var can_shoot = true
var health = 5
signal player_hit(value)

@export var speed = 100

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
func _physics_process(_delta):
	get_input()
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_accept"):
		if can_shoot:
			shoot()
			$Timer.start(0.2)
			can_shoot = false
			
func shoot():
	var b = fireball.instantiate()
	get_parent().add_child(b)
	b.global_position = $Marker2D.global_position

func _on_timer_timeout() -> void:
	$Timer.stop()
	can_shoot = true

func take_damage():
	health -= 1
	emit_signal("player_hit", health)
	if health == 0:
		queue_free()
		get_tree().change_scene_to_file("res://scene/deathscreen.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		print("whattt")
		health = 1
		take_damage()
