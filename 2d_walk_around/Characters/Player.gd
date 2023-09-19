extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction :Vector2 = Vector2(0,1)

# property rightclick to copy property path.
# parameters/Idle(BlendSpace2D/blend_position

@onready var animation_tree = $AnimationTree

func _ready():
	animation_tree.set("parameters/Idle/blend_position", starting_direction)

func _physics_process(_delta):
	# https://docs.godotengine.org/en/stable/classes/class_input.html#class-input-method-get-action-strength
	# get action buttons (input) 
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	print(input_direction)
	
	# update velocity
	velocity = input_direction * move_speed

	move_and_slide()
