extends Node2D



func _on_button_button_down():
	get_parent().get_parent().get_parent().get_parent().get_node("Character").visible=false
	get_parent().get_parent().get_parent().get_parent().get_node("Map").visible=true
