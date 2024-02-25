extends Node2D

var item_in_hand = null
@export var test_item: PackedScene
var a
@export var wood=0
var stone=0
var grass=0
# Called when the node enters the scene tree for the first time.
func _ready():
	load_a()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(wood)
	refresh_Inventory()
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
		"wood":wood,
		"stone":stone,
		"grass":grass,
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
		"metal armor shoe":0,
		"metal armor trimble":0,
		"gold axe":0,
		"gold pickaxe":0,
		"gold sword":0,
		"godly bow":0,
		"gold spear":0,
		"gold armor helm":0,
		"gold armor torso":0,
		"gold armor leggings":0,
		"gold armor shoe":0,
		"sulfur":0,
		"sulfur sword":0,
		"sulfur dinamite":0,
		"enhanced armor helm":0,
		"enhanced armor torso":0,
		"enhanced armor leggings":0,
		"enhanced armor shoe":0,
		"crystal armor helm":0,
		"crystal armor torso":0,
		"crystal armor leggings":0,
		"crystal armor shoe":0,
		"crystal axe":0,
		"crystal pickaxe":0,
		"crystal sword":0,
		"crystal totem":0,
		"crystal halbert":0,
		"The one true spear":0,
		"grass sword":0
	}
	return InventroyJSON
func refresh_Inventory():
	var save_file=FileAccess.open("res://save/Characters/Inv.save",FileAccess.WRITE)
	var vardata=self.call("InventroyJSON")
	var json_string=JSON.stringify(vardata)
	save_file.store_line(json_string)
	
func Save_Inventory():
	var save_file=FileAccess.open("res://save/Characters/Inv"+str(a)+".save",FileAccess.WRITE)
	var vardata=self.call("InventroyJSON")
	var json_string=JSON.stringify(vardata)
	save_file.store_line(json_string)
	
func load_a():
	if not FileAccess.file_exists("res://save/save_a.save"):
		return
	var save_at=FileAccess.open("res://save/save_a.save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())

	var var_data=json.get_data()

	self.set("a",var_data["a"]+1)
func load_Inv():
	if not FileAccess.file_exists("res://save/Characters/Inv.save"):
		return
	var save_at=FileAccess.open("res://save/Characters/Inv.save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())

	var node_data=json.get_data()
	
	for i in node_data.keys():
		if i=="filename" or i=="parent" or i=="position_x" or i=="position_y" :
			continue
		self.set(i,node_data[i])

