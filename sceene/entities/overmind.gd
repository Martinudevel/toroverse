extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func take_damage(damage,damage_type):
	if damage_type=="endSword":
		$Health_Bar.take_damage(damage)
func death():
	get_parent().get_parent().respawn_overmind()
	get_parent().get_parent().get_node("player_spawner/character_body").addvertisment_start()
	queue_free()
