extends Node2D

var house=load("res://sceene/buildings/floor.tscn")
var temphouse
var a=0
var temphouse_ver=false
var t=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if temphouse_ver==true:
		temphouse.position=get_global_mouse_position()
		self.visible=false
	if Input.is_action_pressed("Mouse_Left_Click"):
		if temphouse_ver==true:
			if t>5:
				var new_house=house.instantiate()
				get_parent().get_parent().add_child(new_house)
				new_house.name="house"+str(a)
				new_house.position=temphouse.position
				a+=1
			else:
				t+=1
			
	if Input.is_action_pressed("Mouse_right_click"):
		if temphouse_ver==true:
			get_parent().get_parent().get_node("floor").queue_free()
			temphouse_ver=false
			t=0
func _on_texture_button_2_button_down():
	temphouse=load("res://sceene/buildings/floor.tscn").instantiate()
	self.visible=false
	get_parent().get_parent().add_child(temphouse)
	temphouse_ver=true
	return temphouse
