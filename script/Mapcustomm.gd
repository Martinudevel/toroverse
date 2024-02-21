extends Node2D
var Cname="Player"
var y=100
var x=155
var a=0
var pressed=false
var h1=false
var h2=false
var h3=false
var hair

func _ready():
	pass
	load_a()
	var t=0
	print(t)
	while  t<=a:
		load_d(t)
		load_d2(t)
		t+=1
	
		
func _physics_process(delta):
	pass
	
func _on_add_button_down():
	$Character/Character_add.visible=true
	if !pressed:
		var character_save=load("res://sceene/cbaracter_save.tscn")
		var character_c=character_save.instantiate()
		$Character/Save/state.add_child(character_c)
		character_c.name="Player"+str(a)
		character_c.position=Vector2(0,y)
		 
		hair=Sprite2D.new()
		var newmode=$Character/Save/hair
		hair.name="hair"+str(a)
		hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head1.png")
		hair.position=Vector2(60,x)
		hair.scale=Vector2(4,4)
		newmode.add_child(hair)
		pressed=true
func _on_head_button_down():
	#player
	$Character/Character_add/CharacterBody2D/hair/head1.visible=true
	$Character/Character_add/CharacterBody2D/hair/head2.visible=false
	$Character/Character_add/CharacterBody2D/hair/head3.visible=false
	#save
	h1=true
	hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head1.png")
	return h1
func _on_head_2_button_down():
	#player
	$Character/Character_add/CharacterBody2D/hair/head1.visible=false
	$Character/Character_add/CharacterBody2D/hair/head2.visible=true
	$Character/Character_add/CharacterBody2D/hair/head3.visible=false
	#save
	hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head2.png")
	h2=true
	return h2
func _on_head_3_button_down():
	#player
	$Character/Character_add/CharacterBody2D/hair/head1.visible=false
	$Character/Character_add/CharacterBody2D/hair/head2.visible=false
	$Character/Character_add/CharacterBody2D/hair/head3.visible=true
	#save
	hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head3.png")
	h3=true
	return h3
func _on_bodyf_button_down():
	print(a)

func _on_bodym_button_down():
	pass # Replace with function body.


func _on_button_button_down():
	$Character/Character_add.visible=false
	save_state_a()
	save_state_d()
	pressed=false
	a+=1
	y+=120
	x+=120

func save_c():
	var save_c={
	"filename": get_scene_file_path(),
	"parent":get_parent().get_path(),
	"hair1":$hair1.visible,
	"hair2":$hair2.visible,
	"hair3":$hair3.visible
	}
	return save_c
	
func save_d():
	var save_d={
	"filename":"res://sceene/cbaracter_save.tscn",
	"parent":"Character/Save/state",
	"hair1":h1,
	"hair2":h2,
	"hair3":h3,
	"hp":"Character/Save/hair",
	"position_x":0,
	"position_y":y,
	"pos_y_h":x
	}
	print(save_d)
	return save_d
func save_a():
	var save_a={
		"a":a
	}
	return save_a
	
func save_state_a():
	var save_file=FileAccess.open("res://save/save_a.save",FileAccess.WRITE)
	var vardata=self.call("save_a")
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

	self.set("a",var_data["a"])
	
func save_state_d():
	var save_file=FileAccess.open("res://save/save_d"+str(a)+".save",FileAccess.WRITE)
	var vardata=self.call("save_d")
	var json_string=JSON.stringify(vardata)
	save_file.store_line(json_string)
	
func load_d(t):
	if not FileAccess.file_exists("res://save/save_d"+str(t)+".save"):
		return
	var save_at=FileAccess.open("res://save/save_d"+str(t)+".save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())

	var node_data=json.get_data()
	var new_object=load(node_data["filename"]).instantiate()
	get_node(node_data["parent"]).add_child(new_object)
	new_object.name="Player"+str(a)
	new_object.position=Vector2(node_data["position_x"],node_data["position_y"])
	
	for i in node_data.keys():
		if i=="filename" or i=="parent" or i=="position_x" or i=="position_y" :
			continue
		new_object.set(i,node_data[i])
	for i in node_data.keys():
		if i=="position_y" :
			self.set("y",node_data[i]+120)
		if i=="pos_y_h":
			self.set("x",node_data[i]+120)
func load_d2(t):
	if not FileAccess.file_exists("res://save/save_d"+str(t)+".save"):
		return
	var save_at=FileAccess.open("res://save/save_d"+str(t)+".save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())

	var node_data=json.get_data()
	var h=Sprite2D.new()
	get_node(node_data["hp"]).add_child(h)
	h.position=Vector2(60,node_data["pos_y_h"])
	h.scale=Vector2(4,4)
	if node_data["hair1"]==true: 
		h.texture=load("res://graphics/players + entities/playercustomization/fff&text=head1.png")
	if node_data["hair2"]==true:
		h.texture=load("res://graphics/players + entities/playercustomization/fff&text=head2.png")
	if node_data["hair3"]==true:
		h.texture=load("res://graphics/players + entities/playercustomization/fff&text=head3.png")
	
	for i in node_data.keys():
		if i=="hp" or i=="pos_y_h":
			continue
		h.set(i,node_data[i])
	
	
func save_state_c():
	var save_file=FileAccess.open("res://save/save_c.save",FileAccess.WRITE)
	var vardata=self.call("save_c")
	var json_string=JSON.stringify(vardata)
	save_file.store_line(json_string)
	
func load_c():
	if not FileAccess.file_exists("res://save/save_a.save"):
		return
	var save_at=FileAccess.open("res://save/save_a.save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())

	var var_data=json.get_data()
	for key in var_data.keys():
		if key=="a":
			continue
		self.set(key,var_data[key])
	
	
#var node_to_save=$Character/Character_add/CharacterBody2D
#node_to_save.name="Player"+str(a)
#var scene=PackedScene.new()
#scene.pack(node_to_save)
#ResourceSaver.save(scene,"res://character/")
#$Character/Character_add.add_child(load("res://sceene/character_creation.tscn").instantiate())
