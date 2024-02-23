extends Node2D
var rng=RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var x=rng.randf_range(-30000,60000)
	var y=rng.randf_range(-90000,90000)
	var player=load("res://sceene/player_spawner.tscn").instantiate()
	add_child(player)
	player.position=Vector2(x,y)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
