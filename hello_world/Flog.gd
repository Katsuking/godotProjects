extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var player = get_node("../../Player/Player")
var chase = false
var SPEED = 50 

func _ready():
	# set default animation
	get_node("AnimatedSprite2D").play("Idle")

func _physics_process(delta):
	# gravity for flog
	if not is_on_floor():
		velocity.y += gravity * delta
	if chase == true:
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Jump")
		# player position: get_node("path").position
		# flog position: self.position
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").set_flip_h(true)
		else:
			get_node("AnimatedSprite2D").set_flip_h(false)
		velocity.x = direction.x * SPEED # move enemy
	else: # outside of detection
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Idle")
		velocity.x = 0
	move_and_slide()

func _on_player_detection_area_2d_body_entered(body):
	if body.name == "Player":
		chase = true
		print("chase:", chase)

func _on_player_detection_area_2d_body_exited(body):
	if body.name == "Player":
		chase = false
		print("chase:", chase)

func _on_player_death_area_2d_body_entered(body):
	if body.name == "Player":
		dealth()

func _on_player_collision_area_2d_body_entered(body):
	if body.name == "Player":
		body.health -= 3
		# dealth()

func dealth():
	velocity.x = 0
	chase = false
	get_node("AnimatedSprite2D").play("Death")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()


