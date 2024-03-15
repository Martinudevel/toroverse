extends Node2D

var Health = 100.0

var resource_count = 3
@export var resource: PackedScene
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
		var temp_item = resource.instantiate()
		get_node("/root").add_child(temp_item)
		temp_item.position = Vector2(self.position.x + rng.randi_range(-15, 15), self.position.y + rng.randi_range(-15, 15))
	self.queue_free()
