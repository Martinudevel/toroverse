extends Node2D

var follow_hand = false
var id = 0
var stack_val = 1
var in_inventory = false

@export var speed = 1.0
@export var range = 5.0
var magnet = false
var magnet_body

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(follow_hand == true):
		self.position = get_global_mouse_position()
	
	if((magnet == true)&&(magnet_body != null)):
		var new_pos = self.position
		if(self.position.x < magnet_body.position.x - range):
			new_pos.x += speed
		elif(self.position.x > magnet_body.position.x + range):
			new_pos.x -= speed
		if(self.position.y < magnet_body.position.y - range):
			new_pos.y += speed
		elif(self.position.y > magnet_body.position.y + range):
			new_pos.y -= speed
		if((new_pos == self.position)&&(magnet == true)):
			magnet_body.acquire_item(self)
		else:
			self.position = new_pos

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

func magnetised(player):
	if(in_inventory == false):
		magnet = true
		magnet_body = player
	

