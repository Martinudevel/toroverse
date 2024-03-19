extends Node2D

var Health = 100.0

var death_animation = false
var resource_count = 3
@onready var item_drop: PackedScene = preload("res://inventory/item_collectible.tscn")
@onready var resource: InvItem = preload("res://inventory/items/wood.tres")
var rng = RandomNumberGenerator.new();

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(death_animation == true):
		if(self.rotation < 1.57):
			self.set_rotation(self.rotation + (0.0006/delta))
		else:
			death_drop()

func take_damage(damage: int, tool: String):
	if((tool == "axe")||(tool == "endSword")):
		print("hit")
		Health -= damage
		if(Health <= 0):
			death_animation = true

func death_drop():
	for i in resource_count:
		var temp_item = item_drop.instantiate()
		temp_item.inv_item = resource
		get_node("/root").add_child(temp_item)
		temp_item.position = Vector2(self.position.x + rng.randi_range(-15, 15), self.position.y + rng.randi_range(-15, 15))
	self.queue_free()
