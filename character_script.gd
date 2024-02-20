extends Node2D
@export var f = 0.5#determines how fast the object arrives at destination and the frequency of vibrations (if there are any)
@export var zeta = 1.0#dampens vibrations over time (if at zero, it never stops vibrating), if >= 1 the body never vibrates and instead slows it down
@export var r = 1.0#determines the time it takes for the object to start moving if <0 the object anticipates, if >0 begins immediatly, if >1 it overshoots (then corrects, of course)

var k1 = 0;
var k2 = 0;
var k3 = 0;

@export var speed = 1#the speed of the object

var y = Vector2(0, 0)
var yd = Vector2(0, 0)

var x = Vector2(0, 0)
var xd = Vector2(0, 0)
var xp = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	y = self.position
	x = self.position
	xp = self.position
	xd = Vector2(speed, speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	k1 = zeta/(PI*f)
	k2 = 1/pow((2*PI*f), 2)
	k3 = r*zeta/(2*PI*f)
	
	if(Input.is_action_pressed("Move_Down")):
		#self.position = Vector2(self.position.x, self.position.y+1)
		x = Vector2(x.x, x.y+speed)
	if(Input.is_action_pressed("Move_Up")):
		#self.position = Vector2(self.position.x, self.position.y-1)
		x = Vector2(x.x, x.y-speed)
	if(Input.is_action_pressed("Move_Right")):
		#self.position = Vector2(self.position.x+1, self.position.y)
		x = Vector2(x.x+speed, x.y)
	if(Input.is_action_pressed("Move_Left")):
		#self.position = Vector2(self.position.x-1, self.position.y)
		x = Vector2(x.x-speed, x.y)
	
	xd = (x-xp)/delta
	print(xd)
	xp = x
	
	y = y + delta*yd
	yd = yd + delta*(x + k3*xd - y - k1*yd)/k2
	
	self.position = y
