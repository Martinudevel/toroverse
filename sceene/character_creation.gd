extends CharacterBody2D
var hair1=false
var hair2=false
var hair3=false
var a=""
# Called when the node enters the scene tree for the first time.
func _ready():
	load_custom()
	load_c()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if hair1==true:
			$hair.texture=load("res://graphics/players + entities/playercustomization/head1.png")
		if hair2==true:
			$hair.texture=load("res://graphics/players + entities/playercustomization/head2.png")
		if hair3==true:
			$hair.texture=load("res://graphics/players + entities/playercustomization/head3.png")

		
	
func load_custom():
	if not FileAccess.file_exists("res://save/custom.save"):
		return
	var save_at=FileAccess.open("res://save/custom.save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())

	var var_data=json.get_data()
	self.set("a",var_data["custom"])


func load_c():
	if not FileAccess.file_exists("res://save/Players/"+str(a)+".save"):
		return
	var save_at=FileAccess.open("res://save/Players/"+str(a)+".save",FileAccess.READ)
	var json_string=save_at.get_line()
	var json=JSON.new()
	var praseresult=json.parse(json_string)
	if not praseresult==OK:
		print("JSON Parase Error:",json.get_error_message(),"in",json_string,"at line",json.get_error_line())
	var var_data=json.get_data()
	self.set("hair1",var_data["hair1"])
	self.set("hair2",var_data["hair2"])
	self.set("hair3",var_data["hair3"])
	
