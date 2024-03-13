extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/item/item_display
@onready var amount_text: Label = $CenterContainer/item/Label
@onready var inventory = self.get_parent().get_parent().get_parent()
var inv_pos = -1

var entered = false

func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		if(slot.item.id == 1):
			item_visual.rotation_degrees = 45
			item_visual.position = Vector2(2.2, 2.5)
		amount_text.text = str(slot.amount)
		if(slot.amount >= 2):
			amount_text.visible = true
		else:
			amount_text.visible = false

func _process(delta):
	if((Input.is_action_just_pressed("Mouse_Left_Click"))&&(entered == true)):
		if(inventory.has_method("update_slots")):
			interact_left()
	if((Input.is_action_just_pressed("Mouse_Right_Click"))&&(entered == true)):
		if(inventory.has_method("update_slots")):
			interact_right()

func _on_mouse_entered():
	self.get_child(1).modulate = Color(0.20, 0.20, 1)
	entered = true


func _on_mouse_exited():
	self.get_child(1).modulate = Color(0.0, 0.0, 1)
	entered = false

func interact_left():
	if(inventory.slot_in_hand != null):
		inventory.add_items_in_slot(inv_pos, $CenterContainer/item)
	elif(item_visual.visible == true):
		inventory.remove_item_from_slot(inv_pos, $CenterContainer/item)

func interact_right():
	if(item_visual.visible == true):
		inventory.remove_one_item_from_slot(inv_pos, $CenterContainer/item)
