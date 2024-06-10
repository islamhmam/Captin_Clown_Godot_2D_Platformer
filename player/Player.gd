extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var anim=$AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 19


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity 

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("raise")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == -1:
		$AnimatedSprite2D.flip_h=true
	if direction == 1:
		$AnimatedSprite2D.flip_h=false
	if direction:
		velocity.x = direction * SPEED
		if velocity.y ==0:
			anim.play("run")
	else:
		velocity.x = 0
		if velocity.y==0:
			anim.play("idle")
	
	if velocity.y >0:
		anim.play("fall")

	move_and_slide()
