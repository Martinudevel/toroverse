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
	
	var x=rng.randf_range(-20000,20000)
	var y=rng.randf_range(-50000,50000)
	var player=load("res://sceene/player_spawner.tscn").instantiate()
	add_child(player)
	player.position=Vector2(x,y)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func respawn_overmind():
	var x=rng.randf_range(-20000,20000)
	var y=rng.randf_range(-50000,50000)
	var overmind=load("res://sceene/entities/overmind.tscn").instantiate()
	get_node("overmindspawner").add_child(overmind)
	overmind.position=Vector2(x,y)
func spawn_em():
	var x=rng.randf_range(-20000,20000)
	var y=rng.randf_range(-50000,50000)
	var enemy=load("res://enemy_1.tscn").instantiate()
	get_node("Enemylager").add_child(enemy)
	enemy.position=Vector2(x,y)

func _on_timer_timeout():
	spawn_em()
	$Timer.start()
	print("spawn")
