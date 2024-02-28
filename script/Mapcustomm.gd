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
func load_map():
	var t=0
	while t<=ma:
		load_m(t)
		t+=1
		print(t)
	
func _ready():
	load_a()
	var t=0
	while  t<=a:
		load_d(t)
		load_d2(t)
		t+=1
	
#Character save
	
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
	$Character/Character_add/CharacterBody2D/hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head1.png")
	
	#save
	h1=true
	h2=false
	h3=false
	hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head1.png")
	return [h2, h1, h3]
func _on_head_2_button_down():
	#player
	$Character/Character_add/CharacterBody2D/hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head2.png")
	#save
	hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head2.png")
	h2=true
	h1=false
	h3=false
	return [h2, h1, h3]
func _on_head_3_button_down():
	#player
	$Character/Character_add/CharacterBody2D/hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head3.png")
	#save
	hair.texture=load("res://graphics/players + entities/playercustomization/fff&text=head3.png")
	h3=true
	h1=false
	h2=false
	return [h2, h1, h3]
func _on_bodyf_button_down():
	print(a)
	
func _on_bodym_button_down():
	pass # Replace with function body.


func _on_button_button_down():
	$Character/Character_add.visible=false
	save_state_a()
	save_state_d()
	save_state_c()
	pressed=false
	a+=1
	y+=120
	x+=120

func save_c():
	var save_c={
	"hair1":h1,
	"hair2":h2,
	"hair3":h3
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
	"pos_y_h":x,
	"a":a
	}
	print(save_d)
	return save_d
func save_a():
	var save_a={
		"a":a,
		"ma":ma
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

	self.set("a",var_data["a"]+1)
	self.set("ma",var_data["ma"]+1)
	
func save_state_d():
	var save_file=FileAccess.open("res://save/Characters/save_d"+str(a)+".save",FileAccess.WRITE)
	var vardata=self.call("save_d")
	var json_string=JSON.stringify(vardata)
	save_file.store_line(json_string)
	
func load_d(t):
	if not FileAccess.file_exists("res://save/Characters/save_d"+str(t)+".save"):
		return
	var save_at=FileAccess.open("res://save/Characters/save_d"+str(t)+".save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())

	var node_data=json.get_data()
	var new_object=load(node_data["filename"]).instantiate()
	get_node(node_data["parent"]).add_child(new_object)
	new_object.name="Player"+str(t)
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
	if not FileAccess.file_exists("res://save/Characters/save_d"+str(t)+".save"):
		return
	var save_at=FileAccess.open("res://save/Characters/save_d"+str(t)+".save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())

	var node_data=json.get_data()
	var h=Sprite2D.new()
	get_node(node_data["hp"]).add_child(h)
	h.name="hair"+str(t)
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
	var save_file=FileAccess.open("res://save/Players/Player"+str(a)+".save",FileAccess.WRITE)
	var vardata=self.call("save_c")
	var json_string=JSON.stringify(vardata)
	save_file.store_line(json_string)

	
#MapSave
var t=0
var my=100
var ma=0
var pressed_m=false

func _on_add_m_button_down():
	$Map/Character_add.visible=true
	if !pressed_m:
		var map_save=load("res://sceene/map_save.tscn")
		var map_c=map_save.instantiate()
		$Map/save/state.add_child(map_c)
		map_c.name="map"+str(ma)
		map_c.position=Vector2(0,my)
		my+=120
		pressed=true
		

func _on_button_m_button_down():
	pressed=false
	$Map/Character_add.visible=false
	save_state_a()
	save_state_m()
	ma+=1

func _on_custom_2_button_down():
	$Map/Character_add/custom.visible=true

func save_m():
	var save_m={
	"filename":"res://sceene/map_save.tscn",
	"parent":"Map/save/state",
	"position_x":0,
	"position_y":my,
	}
	return save_m
func save_state_m():
	var save_file=FileAccess.open("res://save/Maps/save_m"+str(ma)+".save",FileAccess.WRITE)
	var vardata=self.call("save_m")
	var json_string=JSON.stringify(vardata)
	save_file.store_line(json_string)
	
func load_m(t):
	if not FileAccess.file_exists("res://save/Maps/save_m"+str(t)+".save"):
		return
	var save_at=FileAccess.open("res://save/Maps/save_m"+str(t)+".save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())

	var node_data=json.get_data()
	var new_object=load(node_data["filename"]).instantiate()
	get_node(node_data["parent"]).add_child(new_object)
	new_object.name="Map"+str(t)
	new_object.position=Vector2(node_data["position_x"],node_data["position_y"]-120)
	
	for i in node_data.keys():
		if i=="filename" or i=="parent" or i=="position_x" or i=="position_y" :
			continue
		new_object.set(i,node_data[i])
	for i in node_data.keys():
		if i=="position_y" :
			self.set("my",node_data[i])


func _on_edit_m_button_down():
	pass
