extends CharacterBody2D
var SPEED = 10.0
@onready var inventory: Control = $Player_Inventory
@onready var Axe: Node2D = $Axe
var empty_hand=true
var inventory_openned = false
var temp_invent
var shifted


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if(Input.is_action_just_pressed("e")):
		if empty_hand:
			if $RayCast2D.is_colliding():
				$RayCast2D.get_collider().collect()
	if Input.is_key_pressed(KEY_SHIFT):
		SPEED=20
		shifted=true
	else :
		SPEED=10
		shifted=false
	var direction = Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
		if not shifted:
			$CharacterBody2D/AnimatedSprite2D.play("move_m")
		else:
			$CharacterBody2D/AnimatedSprite2D.play("run_m")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	var directiony = Input.get_axis("Move_Up","Move_Down")
	if directiony:
		velocity.y = directiony * SPEED
		if not shifted:
			$CharacterBody2D/AnimatedSprite2D.play("move_m")
		else:
			$CharacterBody2D/AnimatedSprite2D.play("run_m")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if not directiony and direction:
		$CharacterBody2D/AnimatedSprite2D.play("idle_m")
	move_and_collide(velocity)

	
	if(Input.is_action_just_pressed("Open_Inventory")):
		if(inventory_openned == false):
			inventory_openned = true
			inventory.open()
		else:
			inventory_openned = false
			inventory.close()
	"""
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
	"""
	if Input.is_action_just_pressed("building"):
		$Build.visible=true

func open_inventory():
	temp_invent = inventory.instantiate()
	self.get_child(0).add_child(temp_invent)
	temp_invent.scale=Vector2(0.9,0.9)
	
func close_inventory():
	temp_invent.queue_free()

func acquire_item(item: StaticBody2D):
	item.magnet = false
	inventory.pick_up_item(item.inv_item)
	item.queue_free()

func _on_item_gather_range_area_entered(area):
	if(area.get_parent().has_method("magnetised")):
		print("spotted")
		area.get_parent().magnetised(self)


func _on_item_gather_range_area_exited(area):
	pass # Replace with function body.

func get_hand():
	return get_node("%Hand_Inventory")

"""
func gather(item):
	inv.insert(item)
"""

func use_tool(type: String, texture: Texture2D):
	Axe.use(type, texture)
	$CharacterBody2D/AnimatedSprite2D.play("interact")

func use_item_right(id: int):
	print("use")
