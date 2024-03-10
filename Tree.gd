extends Node2D

var Health = 100.0

var death_animation = false
var resource_count = 3
@export var resource: PackedScene
var rng = RandomNumberGenerator.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("Mouse_Right_Click")):
		death_animation = true
	if(death_animation == true):
		if(self.rotation < 1.57):
			self.set_rotation(self.rotation + (0.0006/delta))
		else:
			death_drop()

func Damaged(damage):
	Health -= damage
	if(Health <= 0):
		death_animation = true

func death_drop():
	for i in resource_count:
		var temp_item = resource.instantiate()
		get_node("/root").add_child(temp_item)
		temp_item.position = Vector2(self.position.x + rng.randi_range(-15, 15), self.position.y + rng.randi_range(-15, 15))
	self.queue_free()
