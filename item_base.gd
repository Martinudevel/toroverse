extends Node2D

var follow_hand = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(follow_hand == true):
		self.position = get_global_mouse_position()
