extends Node2D
var rng=RandomNumberGenerator.new()
var zone1=0
var zone2=0
var zone3=0
var zone4=0
var zone5=0
var zone6=0
var zone7=0
var zone8=0
var zone9=0
var zone10=0
var zone11=0
var zone12=0
@onready var z1=$zone1
@onready var z2=$zone2
@onready var z3=$zone3
@onready var z4=$zone4
@onready var z5=$zone5
@onready var z6=$zone6
@onready var z7=$zone7
@onready var z8=$zone8
@onready var z9=$zone9
@onready var z10=$zone10
@onready var z11=$zone11
@onready var z12=$zone12
# Called when the node enters the scene tree for the first time.
func _ready():
	var x=rng.randf_range(-30000,30000)
	var y=rng.randf_range(-70000,70000)
	var player=load("res://sceene/player_spawner.tscn").instantiate()
	add_child(player)
	player.position=Vector2(x,y)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
