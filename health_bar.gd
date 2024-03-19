extends Control

var tween: Tween
var MAX_health: int = 100
var current_health:int

var MAX_scale = 50

func _ready():
	current_health = MAX_health

func take_damage(damage: int):
	current_health -= damage
	if(current_health <= 0):
		current_health = 0
		self.get_parent().death()
	tween = create_tween().set_parallel(true)
	tween.tween_property($Current_Health, "scale:x", MAX_scale*current_health/MAX_health, 0.05).set_ease(Tween.EASE_OUT)
	tween.tween_property($Current_Health, "position:x", (MAX_scale/2)*current_health/MAX_health, 0.05).set_ease(Tween.EASE_OUT)
	

