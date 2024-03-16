extends Node2D

var Player: CharacterBody2D = null
var speed: int = 3
@onready var range = $Enemy_Detection/CollisionShape2D.shape.radius
var range_of_attack: int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Player != null):
		var new_pos = self.position
		if(self.position.x < Player.position.x):
			new_pos.x += speed
		elif(self.position.x > Player.position.x):
			new_pos.x -= speed
		
		if(self.position.y < Player.position.y):
			new_pos.y += speed
		elif(self.position.y > Player.position.y):
			new_pos.y -= speed
		
		if(sqrt(pow((new_pos.x - Player.position.x), 2) + pow((new_pos.y - Player.position.y), 2)) <= range_of_attack):
			print("attack")
		else:
			print(new_pos)
			self.position = new_pos


func _on_enemy_detection_body_entered(body):
	if(body.has_method("use_tool")):
		Player = body
