extends CharacterBody2D

# Set mob's initial health to 3
var health = 3

@onready var player = get_node("/root/Game/Player")


func _ready():
	# Play slime walk animation
	%Slime.play_walk()
	

func _physics_process(delta: float) -> void:
	# Move mob towards player
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()
	
	
func take_damage():
	health -= 1
	# Play slim hurt animation
	%Slime.play_hurt()
	
	# If mob has no health, it dies
	if health == 0:
		queue_free()
		
		const SMOKE_SCENE = preload("uid://dhmhmrth6rdce")
		var smoke = SMOKE_SCENE.instantiate()
		# Add smoke node as sibling of mob node, so that it doesn't disappear with mob
		get_parent().add_child(smoke)
		smoke.global_position = global_position
