extends Node2D

var Health = 100.0

var resource_count = 3
@onready var item_drop: PackedScene = preload("res://inventory/item_collectible.tscn")
@onready var resource: InvItem = preload("res://inventory/items/stone.tres")
var rng = RandomNumberGenerator.new();


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage: int, tool: String):
	if(tool == "pickaxe"):
		print("hit")
		Health -= damage
		if(Health <= 0):
			death_drop()

func death_drop():
	for i in resource_count:
		var temp_item = item_drop.instantiate()
		temp_item.inv_item = resource
		get_parent().get_parent().add_child(temp_item)
		temp_item.position = Vector2(self.global_position.x + rng.randi_range(-15, 15), self.global_position.y + rng.randi_range(-15, 15))
	self.queue_free()
