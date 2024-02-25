extends Node2D

var item_in_hand = null
@export var test_item: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("test")):
		add_item()

func remove_item_from_slot(item):
	item_in_hand = item
	self.add_child(item)
	item.follow_hand = true

func add_item():
	var temp_item = test_item.instantiate()
	for i in self.get_child(0).get_child_count():
		if(self.get_child(0).get_child(i).itemed == false):
			self.get_child(0).get_child(i).add_child(temp_item)
			self.get_child(0).get_child(i).itemed = true
			self.get_child(0).get_child(i).item_count = 1
			break

func InventroyJSON():
	var InventroyJSON={
		"wood":0,
		"stone":0,
		"grass":0,
		"ore":0,
		"metal":0,
		"dust":0,
		"gold":0,
		"cristal":0,
		"wooden Bow":0,
		"wooden Sword":0,
		"wooden pickaxe":0,
		"wooden axe":0,
		"metal axe":0,
		"metal pickaxe":0,
		"metal sword":0,
		"metal armor helm":0,
		"metal armor torso":0,
		"metal armor leggings":0,
		"metal armor shoe":0
		
	}
