extends Node2D
var Cname="Player"
var y=100
var x=60
@export var a=0
var pressed=false



func _ready():
	load_a()
	
func _on_add_button_down():
	$Character/Character_add.visible=true
	if !pressed:
		var character_save=load("res://sceene/cbaracter_save.tscn")
		var character_c=character_save.instantiate()
		$Character/Save.add_child(character_c)
		character_c.name="Player"+str(a)
		character_c.position=Vector2(0,y)
		var hair1=Sprite2D.new()
		var hair2=Sprite2D.new()
		var hair3=Sprite2D.new()
		var z="Character/Save/"+"Player"+str(a)
		var newmode=get_node(z)
		newmode.add_child(hair1)
		hair1.name="hair1"
		hair1.texture=load("res://graphics/players + entities/playercustomization/fff&text=head1.png")
		hair1.position=Vector2(60,x)
		hair1.scale=Vector2(4,4)
		newmode.add_child(hair2)
		hair2.name="hair2"
		hair2.texture=load("res://graphics/players + entities/playercustomization/fff&text=head2.png")
		hair2.position=Vector2(60,x)
		hair2.scale=Vector2(4,4)
		newmode.add_child(hair3)
		hair3.name="hair3"
		hair3.texture=load("res://graphics/players + entities/playercustomization/fff&text=head3.png")
		hair3.position=Vector2(60,x)
		hair3.scale=Vector2(4,4)
		y+=120
		pressed=true
func _on_head_button_down():
	#player
	$Character/Character_add/CharacterBody2D/hair/head1.visible=true
	$Character/Character_add/CharacterBody2D/hair/head2.visible=false
	$Character/Character_add/CharacterBody2D/hair/head3.visible=false
	#save
	var z="Character/Save/"+"Player"+str(a)+"/hair1"
	var p="Character/Save/"+"Player"+str(a)+"/hair2"
	var q="Character/Save/"+"Player"+str(a)+"/hair3"
	var hair1=get_node(z)
	var hair2=get_node(p)
	var hair3=get_node(q)
	hair1.visible=true
	hair2.visible=false
	hair3.visible=false
func _on_head_2_button_down():
	#player
	$Character/Character_add/CharacterBody2D/hair/head1.visible=false
	$Character/Character_add/CharacterBody2D/hair/head2.visible=true
	$Character/Character_add/CharacterBody2D/hair/head3.visible=false
	#save
	var z="Character/Save/"+"Player"+str(a)+"/hair1"
	var p="Character/Save/"+"Player"+str(a)+"/hair2"
	var q="Character/Save/"+"Player"+str(a)+"/hair3"
	var hair1=get_node(z)
	var hair2=get_node(p)
	var hair3=get_node(q)
	hair2.visible=true
	hair1.visible=false
	hair3.visible=false
func _on_head_3_button_down():
	#player
	$Character/Character_add/CharacterBody2D/hair/head1.visible=false
	$Character/Character_add/CharacterBody2D/hair/head2.visible=false
	$Character/Character_add/CharacterBody2D/hair/head3.visible=true
	#save
	var z="Character/Save/"+"Player"+str(a)+"/hair1"
	var p="Character/Save/"+"Player"+str(a)+"/hair2"
	var q="Character/Save/"+"Player"+str(a)+"/hair3"
	var hair1=get_node(z)
	var hair2=get_node(p)
	var hair3=get_node(q)
	hair3.visible=true
	hair2.visible=false
	hair1.visible=false
func _on_bodyf_button_down():
	print(a)

func _on_bodym_button_down():
	pass # Replace with function body.


func _on_button_button_down():
	$Character/Character_add.visible=false
	pressed=false
	a+=1
	save_state_a()

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
	"filename": get_scene_file_path(),
	"parent":get_parent().get_path(),
	"hair1":$hair1.visible,
	"hair2":$hair2.visible,
	"hair3":$hair3.visible,
	"position_x":0,
	"position_y":y
	}
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
	self.set("a",var_data)
	
	
	
	
	
	
#var node_to_save=$Character/Character_add/CharacterBody2D
#node_to_save.name="Player"+str(a)
#var scene=PackedScene.new()
#scene.pack(node_to_save)
#ResourceSaver.save(scene,"res://character/")
#$Character/Character_add.add_child(load("res://sceene/character_creation.tscn").instantiate())
