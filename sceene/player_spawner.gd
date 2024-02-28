extends Node2D
var new_player=load("res://character_body.tscn").instantiate()


func _ready():
	add_child(new_player)
	new_player.scale=Vector2(0.9,0.9)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
