extends Area2D

var travelled_distance = 0

func _physics_process(delta: float) -> void:
	const BULLET_SPEED = 800
	const BULLET_RANGE = 18000
	
	# Return new vector that is rotated by the desired angle
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * BULLET_SPEED * delta
	
	# Increase travelled distance based on speed of bullet
	travelled_distance += BULLET_SPEED
	
	# Destroy bullet if it exits its range
	if travelled_distance > BULLET_RANGE:
		queue_free()


# Called when bullet hits something
func _on_body_entered(body: Node2D) -> void:
	# Destroy bullet
	queue_free()
	# Check if the touched body has a take_damage() function
	if body.has_method("take_damage"):
		body.take_damage()
