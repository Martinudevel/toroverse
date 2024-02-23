extends Node2D
var rng=RandomNumberGenerator.new()
var rngx=RandomNumberGenerator.new()
var rngy=RandomNumberGenerator.new()
var t=0
var r=0
var tree_number=0
var rock_number=0
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	tree_number=rng.randf_range(180,220)
	rock_number=rng.randf_range(130,160)
	make_tree_map()
	make_rock_map()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func make_tree_map():
	while t<tree_number:
		rngx.randomize()
		rngy.randomize()
		var x=rngx.randf_range(-16000,16000)
		var y=rngy.randf_range(-23000,23000)
		var tree=load("res://sceene/tree.tscn").instantiate()
		add_child(tree)
		tree.position=Vector2(x,y)
		t+=1
func make_rock_map():
	while r<rock_number:
		rngx.randomize()
		rngy.randomize()
		var x=rngx.randf_range(-16000,16000)
		var y=rngy.randf_range(-23000,23000)
		var rock=load("res://sceene/rock.tscn").instantiate()
		add_child(rock)
		rock.position=Vector2(x,y)
		r+=1
