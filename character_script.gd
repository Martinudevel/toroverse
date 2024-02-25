extends CharacterBody2D
var SPEED = 10.0
@export var inventory: PackedScene
var empty_hand=true
var inventory_openned = false
var temp_invent

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if(Input.is_action_just_pressed("e")):
		if empty_hand:
			if $RayCast2D.is_collidibg():
				$RayCast2D.get_collider().collect()
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
	if(Input.is_action_just_pressed("1")):
		$"inventory_hand/invwntory border/Inventory_Slot".selected()
		$"inventory_hand/invwntory border/Inventory_Slot2".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot3".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot4".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot5".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot6".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot7".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot8".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot9".unselected()
	if(Input.is_action_just_pressed("2")):
		$"inventory_hand/invwntory border/Inventory_Slot2".selected()
		$"inventory_hand/invwntory border/Inventory_Slot".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot3".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot4".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot5".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot6".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot7".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot8".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot9".unselected()
	if(Input.is_action_just_pressed("3")):
		$"inventory_hand/invwntory border/Inventory_Slot3".selected()
		$"inventory_hand/invwntory border/Inventory_Slot2".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot4".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot5".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot6".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot7".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot8".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot9".unselected()
	if(Input.is_action_just_pressed("4")):
		$"inventory_hand/invwntory border/Inventory_Slot4".selected()
		$"inventory_hand/invwntory border/Inventory_Slot2".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot3".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot5".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot6".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot7".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot8".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot9".unselected()
	if(Input.is_action_just_pressed("5")):
		$"inventory_hand/invwntory border/Inventory_Slot5".selected()
		$"inventory_hand/invwntory border/Inventory_Slot2".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot3".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot4".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot6".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot7".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot8".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot9".unselected()
	if(Input.is_action_just_pressed("6")):
		$"inventory_hand/invwntory border/Inventory_Slot6".selected()
		$"inventory_hand/invwntory border/Inventory_Slot2".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot3".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot4".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot5".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot7".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot8".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot9".unselected()
	if(Input.is_action_just_pressed("7")):
		$"inventory_hand/invwntory border/Inventory_Slot7".selected()
		$"inventory_hand/invwntory border/Inventory_Slot2".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot3".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot4".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot5".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot6".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot8".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot9".unselected()
	if(Input.is_action_just_pressed("8")):
		$"inventory_hand/invwntory border/Inventory_Slot8".selected()
		$"inventory_hand/invwntory border/Inventory_Slot2".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot3".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot4".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot5".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot6".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot7".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot9".unselected()
	if(Input.is_action_just_pressed("9")):
		$"inventory_hand/invwntory border/Inventory_Slot9".selected()
		$"inventory_hand/invwntory border/Inventory_Slot2".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot3".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot4".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot5".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot6".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot7".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot8".unselected()
		$"inventory_hand/invwntory border/Inventory_Slot".unselected()
	
func open_inventory():
	temp_invent = inventory.instantiate()
	self.get_child(0).add_child(temp_invent)
	temp_invent.scale=Vector2(0.9,0.9)
	
func close_inventory():
	temp_invent.queue_free()
