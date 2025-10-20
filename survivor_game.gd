extends Node2D


func _ready() -> void:
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()


# Spawn mob at random location
func spawn_mob():
	#const MOB = preload("res://mob.tscn")
	# Create new mob node
	var new_mob = preload("res://mob.tscn").instantiate()
	# Get random location for new mob
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	# Add mob node as child of Game node
	add_child(new_mob)


# Spawn mob on timer
func _on_timer_timeout() -> void:
	spawn_mob()


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true
