extends Area2D


func _physics_process(delta: float) -> void:
	# Find enemies in range of gun (as array)
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		# Target first enemy in array
		var target_enemy = enemies_in_range[0]
		# Point gun at target enemy
		look_at(target_enemy.global_position)


func shoot():
		const BULLET = preload("res://bullet.tscn")
		# Create new instance of bullet scene
		var new_bullet = BULLET.instantiate()
		# Make bullet match position and rotation of shooting point
		new_bullet.global_position = %ShootingPoint.global_position
		new_bullet.global_rotation = %ShootingPoint.global_rotation
		# Add bullet as child node of ShootingPoint node
		%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout() -> void:
	shoot()
