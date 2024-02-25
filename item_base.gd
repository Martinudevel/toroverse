extends Node2D

var follow_hand = false
var id = 0
var stack_val = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(follow_hand == true):
		self.position = get_global_mouse_position()
		
func stack(ammount):
	stack_val = ammount
	if(ammount < 10):
		$VBoxContainer/HBoxContainer/MarginContainer.set_custom_minimum_size(Vector2(18, 4))
	else:
		$VBoxContainer/HBoxContainer/MarginContainer.set_custom_minimum_size(Vector2(15, 4))
	$VBoxContainer/HBoxContainer/TextArea/CenterContainer/Label.text = str(ammount)
	if(ammount >= 2):
		$VBoxContainer/HBoxContainer/TextArea/CenterContainer/Label.visible = true
	else:
		$VBoxContainer/HBoxContainer/TextArea/CenterContainer/Label.visible = false
