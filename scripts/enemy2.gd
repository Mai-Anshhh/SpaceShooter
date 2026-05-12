extends CharacterBody2D

var enemyball = preload("res://scene/enemyball.tscn")
var can_shoot = false
var health = 2
signal enemy_die

func _ready():
	$Timer.start(2.0)
	var spawnline = get_parent().get_node("spawnline")
	var point0 = spawnline.to_global(spawnline.get_point_position(0))
	var point1 = spawnline.to_global(spawnline.get_point_position(1))
	var line_length = point1.x - point0.x
	global_position.x = point0.x + randf() * line_length
	global_position.y = point0.y

func _physics_process(delta):
	# delete if past screen
	if position.y > 100:
		queue_free()
		return
	if can_shoot:
		shoot()
		$Timer.start(randi() % 4 + 1)
		can_shoot = false

	velocity.y = 1500 * delta
	move_and_slide()

func shoot():
	var inst = enemyball.instantiate()
	get_parent().add_child(inst)
	inst.global_position = $bulletpos.global_position

func _on_timer_timeout() -> void:
	can_shoot = true
	$Timer.stop()
	
func take_damage():
	health -= 1
	if health == 0:
		queue_free()
		emit_signal("enemy_die")
