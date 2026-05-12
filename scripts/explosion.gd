extends AnimatedSprite2D

func _ready():
	play("gif")
	await get_tree().create_timer(0.7).timeout
	queue_free()
