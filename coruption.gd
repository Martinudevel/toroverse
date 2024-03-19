extends Node2D

@onready var overmind=$overmind
@onready var spread=$TileMap
var y=0
var b=0
var x=Vector2(y,y)
var z=Vector2(b,b)
var a=Vector2(y,b)
var d=Vector2(b,y)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print($Timer.wait_time)
	print(x)
	x=Vector2(y,y)
	z=Vector2(b,b)
	a=Vector2(y,b)
	d=Vector2(b,y)
	return x and z and a and d
func _on_timer_timeout():
	spread.set_cell(0,x,0,Vector2(0,0),0)
	spread.set_cell(0,z,0,Vector2(0,0),0)
	spread.set_cell(0,a,0,Vector2(0,0),0)
	spread.set_cell(0,d,0,Vector2(0,0),0)
	var i=0
	while i<y:
		spread.set_cell(0,Vector2(i,y),0,Vector2(0,0),0)
		spread.set_cell(0,Vector2(y,i),0,Vector2(0,0),0)
		spread.set_cell(0,Vector2(i,b),0,Vector2(0,0),0)
		spread.set_cell(0,Vector2(b,i),0,Vector2(0,0),0)
		i+=1
	while i>b:
		spread.set_cell(0,Vector2(i,b),0,Vector2(0,0),0)
		spread.set_cell(0,Vector2(b,i),0,Vector2(0,0),0)
		spread.set_cell(0,Vector2(i,y),0,Vector2(0,0),0)
		spread.set_cell(0,Vector2(y,i),0,Vector2(0,0),0)
		i-=1
	
	y+=1
	b-=1
	$Timer.wait_time+=2
	return y and b
	
