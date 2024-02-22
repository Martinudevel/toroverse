extends Node2D
var new_player=load("res://character_body.tscn")


func _ready():
	add_child(new_player.instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
