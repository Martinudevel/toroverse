extends Node2D

var entered = false
var item_count = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((Input.is_action_just_pressed("Mouse_Left_Click"))&&(entered == true)):
		interact_left()
	if((Input.is_action_just_pressed("Mouse_Right_Click"))&&(entered == true)):
		interact_right()



func _on_area_2d_mouse_entered():
	entered = true
	$Slot_Border/Slot_Frame.modulate = Color(0.20, 0.20, 0.20)


func _on_area_2d_mouse_exited():
	entered = false
	$Slot_Border/Slot_Frame.modulate = Color(0.11, 0.11, 0.11)

func interact_left():
	if(self.get_parent().get_parent().item_in_hand == null):
		item_remove_left()
	else:
		item_add_left()

func interact_right():
	item_remove_right()

func item_remove_left():
	if(item_count >= 1):
		var temp_item = self.get_child(2)
		self.remove_child(temp_item)
		self.get_parent().get_parent().remove_item_from_slot(temp_item)
		item_count = 0

func item_remove_right():
	if(item_count >= 1):
		if(self.get_parent().get_parent().item_in_hand == null):
			var temp_item = self.get_child(2).duplicate()
			temp_item.stack(1)
			self.get_parent().get_parent().remove_item_from_slot(temp_item)
			item_count -= 1
			self.get_child(2).stack(item_count)
		elif(self.get_parent().get_parent().item_in_hand.id == self.get_child(2).id):
			self.get_parent().get_parent().item_in_hand.stack(self.get_parent().get_parent().item_in_hand.stack_val + 1)
			item_count -= 1
			self.get_child(2).stack(item_count)
		if(item_count == 0):
			self.get_child(2).queue_free()

func item_add_left():
	if(item_count == 0):
		var temp_item = self.get_parent().get_parent().item_in_hand
		self.get_parent().get_parent().remove_child(temp_item)
		self.add_child(temp_item)
		self.get_parent().get_parent().item_in_hand = null
		temp_item.follow_hand = false
		item_count = temp_item.stack_val;
		return 1
	elif(self.get_parent().get_parent().item_in_hand.id == self.get_child(2).id):
		item_count += self.get_parent().get_parent().item_in_hand.stack_val
		print(item_count)
		self.get_child(2).stack(item_count)
		self.get_parent().get_parent().item_in_hand.queue_free()
		#self.get_parent().get_parent()
		return 1
	return 0
