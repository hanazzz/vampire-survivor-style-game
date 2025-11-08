extends CharacterBody2D

# Custom signal for when player health is depleted
signal health_depleted

# Set player's initial health to 100.0
var health = 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Move in input direction @ 600 pixels/second
	velocity = direction * 600
	move_and_slide()
	
	# Set player walk and idle animations
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	# Set player's damage rate
	const DAMAGE_RATE = 5.0
	# Get array of mobs touching player
	var overlapping_mobs =  %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		# Damage player health according to number of mobs
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		# Update health bar value
		%ProgressBar.value = health
		# Emit signal when player health is depleted
		if health <= 0.0:
			health_depleted.emit()
