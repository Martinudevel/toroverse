extends Node2D

var hp=200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func collect():
	print("colected")
	get_parent().get_node("character_body").add_wood()
