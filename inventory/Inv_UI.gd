extends Control

var is_open = false

@onready var inv: Inv = preload("res://inventory/player_inv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@onready var hand_slots: Array = get_parent().get_hand().get_child(0).get_child(0).get_children()
@export var item: InvItem
var select_sprite: Sprite2D
var select_hand_sprite: Sprite2D

var select_index: int = 0

var slot_in_hand: InvSlot = null

func _ready():
	select_sprite = slots[slots.size()-1]
	slots.remove_at(slots.size()-1)
	select_hand_sprite = hand_slots[hand_slots.size()-1]
	hand_slots.remove_at(hand_slots.size()-1)
	for i in 9:
		slots[i].get_child(0).modulate = Color(0.0, 1.0, 0.0)
	close()
	update_slots()

func _process(delta):
	if(Input.is_action_just_pressed("e")):
		if is_open:
			close()
		else:
			open()
	
	if((Input.is_action_just_pressed("test"))&&(is_open == true)):
		pick_up_item(item)
	
	if(slot_in_hand != null):
		self.get_child(1).position = get_local_mouse_position()
	
	if(Input.is_action_just_pressed("1")):
		select_index = 0
		move_select_sprite(select_index)
	if(Input.is_action_just_pressed("2")):
		select_index = 1
		move_select_sprite(select_index)
	if(Input.is_action_just_pressed("3")):
		select_index = 2
		move_select_sprite(select_index)
	if(Input.is_action_just_pressed("4")):
		select_index = 3
		move_select_sprite(select_index)
	if(Input.is_action_just_pressed("5")):
		select_index = 4
		move_select_sprite(select_index)
	if(Input.is_action_just_pressed("6")):
		select_index = 5
		move_select_sprite(select_index)
	if(Input.is_action_just_pressed("7")):
		select_index = 6
		move_select_sprite(select_index)
	if(Input.is_action_just_pressed("8")):
		select_index = 7
		move_select_sprite(select_index)
	if(Input.is_action_just_pressed("9")):
		select_index = 8
		move_select_sprite(select_index)
	
	if(Input.is_action_just_released("Move_Select_Hand_Item_forward")):
		select_index += 1
		if(select_index > 8):
			select_index = 0
		move_select_sprite(select_index)
	if(Input.is_action_just_released("Move_Select_Hand_Item_backwards")):
		select_index -= 1
		if(select_index < 0):
			select_index = 8
		move_select_sprite(select_index)

func open():
	print("open")
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		update_slot(i)
		slots[i].inv_pos = i

func pick_up_item(item: InvItem):
	var i = inv.insert(item, 1)
	if(i >= 0):
		update_slot(i)

func remove_item_from_slot(slot_pos: int, item: Panel):
	var temp_item = item.duplicate()
	self.add_child(temp_item)
	self.get_child(1).position = get_local_mouse_position()
	#item_in_hand = true
	slot_in_hand = inv.slots[slot_pos]
	inv.slots[slot_pos] = InvSlot.new()
	update_slot(slot_pos)

func remove_one_item_from_slot(slot_pos: int, item: Panel):
	if(slot_in_hand == null):
		var temp_item = item.duplicate()
		self.add_child(temp_item)
		self.get_child(1).position = get_local_mouse_position()
		slot_in_hand = InvSlot.new()
		slot_in_hand.item = inv.slots[slot_pos].item
		slot_in_hand.amount = 1
		self.get_child(1).get_child(1).visible = false
		self.get_child(1).get_child(1).text = str(slot_in_hand.amount)
		inv.slots[slot_pos].amount -= 1
		if(inv.slots[slot_pos].amount == 0):
			inv.slots[slot_pos] = InvSlot.new()
		update_slot(slot_pos)
	elif(slot_in_hand.amount < 99):
		slot_in_hand.amount += 1
		self.get_child(1).get_child(1).visible = true
		self.get_child(1).get_child(1).text = str(slot_in_hand.amount)
		inv.slots[slot_pos].amount -= 1
		if(inv.slots[slot_pos].amount == 0):
			inv.slots[slot_pos] = InvSlot.new()
		update_slot(slot_pos)

func add_items_in_slot(slot_pos: int):
	if(inv.slots[slot_pos].amount + slot_in_hand.amount <= 99):
		inv.insert_at(slot_pos, item, slot_in_hand.amount)
		update_slot(slot_pos)
		slot_in_hand = null
		self.get_child(1).queue_free()
	else:
		slot_in_hand.amount -= 99 - inv.slots[slot_pos].amount
		inv.insert_at(slot_pos, item, 99 - inv.slots[slot_pos].amount)
		update_slot(slot_pos)
		self.get_child(1).get_child(1).text = str(slot_in_hand.amount)
		if(slot_in_hand.amount >= 2):
			self.get_child(1).get_child(1).visible = true
		else:
			self.get_child(1).get_child(1).visible = false

func update_slot(slot_pos):
	slots[slot_pos].update(inv.slots[slot_pos])
	if((slot_pos >= 0)&&(slot_pos < 9)):
		hand_slots[slot_pos].update(inv.slots[slot_pos])

func move_select_sprite(index:int):
	select_sprite.position = Vector2(15+index*25, 15)
	select_hand_sprite.position = Vector2(15+index*25, 15)
