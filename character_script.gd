extends CharacterBody2D
var SPEED = 10.0
extends Node2D
@export var inventory: PackedScene

var inventory_openned = false
var temp_invent

@export var f = 1.0#determines how fast the object arrives at destination and the frequency of vibrations (if there are any)
@export var zeta = 1.0#dampens vibrations over time (if at zero, it never stops vibrating), if >= 1 the body never vibrates and instead slows it down
@export var r = 2.0#determines the time it takes for the object to start moving if <0 the object anticipates, if >0 begins immediatly, if >1 it overshoots (then corrects, of course)

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

	
	if(Input.is_action_just_pressed("Open_Inventory")):
		if(inventory_openned == false):
			inventory_openned = true
			open_inventory()
		else:
			inventory_openned = false
			close_inventory()
	if(Input.is_action_pressed("Move_Down")):
		#self.position = Vector2(self.position.x, self.position.y+1)
		x = Vector2(x.x, x.y+speed)
	if(Input.is_action_pressed("Move_Up")):
		#self.position = Vector2(self.position.x, self.position.y-1)
		x = Vector2(x.x, x.y-speed)
	if(Input.is_action_pressed("Move_Right")):
		#self.position = Vector2(self.position.x+1, self.position.y)
		x = Vector2(x.x+speed, x.y)
	if(Input.is_action_pressed("Move_Left")):
		#self.position = Vector2(self.position.x-1, self.position.y)
		x = Vector2(x.x-speed, x.y)
	
	xd = (x-xp)/delta
	print(xd)
	xp = x
	
	y = y + delta*yd
	yd = yd + delta*(x + k3*xd - y - k1*yd)/k2
	
	self.position = y
	
func open_inventory():
	temp_invent = inventory.instantiate()
	get_node("/root").get_child(0).add_child(temp_invent)
	
func close_inventory():
	temp_invent.queue_free()
