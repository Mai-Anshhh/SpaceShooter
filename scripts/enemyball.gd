extends Area2D

var speed = 200

func _physics_process(delta):
	# delete if past screen
	if position.y > 100:
		queue_free()
		return
	position.y += speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body):
	if body.name == ("Player"):
		var explosion = preload("res://scene/explosion.tscn").instantiate()
		get_parent().add_child(explosion)
		explosion.global_position = global_position
		set_process(false)
		body.take_damage()
		#await get_tree().create_timer(0.2).timeout
		queue_free()
