extends Node2D

var item_in_hand = null
@export var test_item: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("test")):
		add_item(test_item)

func remove_item_from_slot(item):
	item_in_hand = item
	self.add_child(item)
	item.follow_hand = true

func add_item(item):
	if(item.has_method("instantiate")):
		var temp_item = item.instantiate()
		temp_item.in_inventory = true
		item_in_hand = temp_item
		self.add_child(temp_item)
		for i in self.get_child(0).get_child_count():
			if(self.get_child(0).get_child(i).item_add_left() == 1):
				break
	else:
		item.in_inventory = true
		item_in_hand = item
		item.get_parent().remove_child(item)
		self.add_child(item)
		for i in self.get_child(0).get_child_count():
			if(self.get_child(0).get_child(i).item_add_left() == 1):
				break
