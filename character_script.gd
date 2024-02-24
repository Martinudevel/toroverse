extends CharacterBody2D
var SPEED = 10.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if Input.is_key_pressed(KEY_SHIFT):
		SPEED=20
	else :
		SPEED=10
	var direction = Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var directiony = Input.get_axis("Move_Up","Move_Down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_collide(velocity)

	
