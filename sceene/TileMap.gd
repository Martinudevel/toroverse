extends TileMap

var y=16
var b=16
@onready var x:Vector2=world_to_map(y,y)
@onready var z:Vector2=world_to_map(b,b)
@onready var a:Vector2=spread.world_to_map(y,b)
@onready var d:Vector2=spread.world_to_map(b,y)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
