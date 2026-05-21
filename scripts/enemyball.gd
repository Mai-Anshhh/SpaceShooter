extends Area2D

var speed = 200
var velocity = Vector2.ZERO

func setup(spawn_pos: Vector2, dir: Vector2):
	global_position = spawn_pos
	velocity = dir * speed

func _physics_process(delta):
	if position.y > 180:
		queue_free()
		return
	position += velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body):
	if body.name == ("Player"):
		var explosion = preload("res://scene/explosion.tscn").instantiate()
		get_parent().add_child(explosion)
		explosion.global_position = global_position
		set_process(false)
		body.take_damage()
		queue_free()
