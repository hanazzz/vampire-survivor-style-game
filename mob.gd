extends CharacterBody2D

# Set mob's initial health to 3
var health = 3

@onready var player = get_node("/root/Game/Player")


func _physics_process(delta: float) -> void:
	# Move mob towards player
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()
	
	
func take_damage():
	health -= 1
	
	# If mob has no health, it dies
	if health == 0:
		queue_free()
