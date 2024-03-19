extends Node2D

var Player: CharacterBody2D = null
var speed: int = 3
@onready var range = $Enemy_Detection/CollisionShape2D.shape.radius
var range_of_attack: int = 50
var alive: bool = true
@onready var bludgeon_texture: Texture2D = preload("res://inventory/sprites/bludgeon_sprite.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((Player != null)&&(alive == true)):
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
			attack_player()
		else:
			self.position = new_pos

func take_damage(damage: int, tool: String):
	if((tool == "sword")||(tool == "endSword")):
		$Health_Bar.take_damage(damage);

func _on_enemy_detection_body_entered(body):
	if(body.has_method("use_tool")):
		Player = body

func death():
	alive = false
	await get_tree().create_timer(0.5).timeout
	self.queue_free()

func attack_player():
	$Bludgeon.use("bludgeon", bludgeon_texture, Player.global_position)
