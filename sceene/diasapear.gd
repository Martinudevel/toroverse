extends StaticBody2D
@onready var endsword =preload("res://inventory/items/endSword.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	$Sprite2D.visible=false


func _on_area_2d_2_area_entered(area):
	get_parent().get_parent().get_parent().get_node("player spawner/character_body").inv_call(endsword)
