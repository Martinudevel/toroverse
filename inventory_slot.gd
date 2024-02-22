extends Node2D

var entered = false
var itemed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((Input.is_action_just_pressed("Mouse_Left_Click"))&&(entered == true)):
		interact()



func _on_area_2d_mouse_entered():
	entered = true
	$Slot_Border/Slot_Frame.modulate = Color(0.20, 0.20, 0.20)


func _on_area_2d_mouse_exited():
	entered = false
	$Slot_Border/Slot_Frame.modulate = Color(0.11, 0.11, 0.11)

func interact():
	if(self.get_parent().get_parent().item_in_hand == null):
		if(itemed == true):
			var temp_item = self.get_child(2)
			self.remove_child(temp_item)
			self.get_parent().get_parent().remove_item_from_slot(temp_item)
			itemed = false
	else:
		if(itemed == false):
			var temp_item = self.get_parent().get_parent().item_in_hand
			self.get_parent().get_parent().remove_child(temp_item)
			self.add_child(temp_item)
			self.get_parent().get_parent().item_in_hand = null
			temp_item.follow_hand = false
			itemed = true
