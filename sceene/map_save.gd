extends Node2D


func _on_button_button_down():
	get_parent().get_parent().get_parent().get_parent().get_tree().change_scene_to_file("res://sceene/map.tscn")
	
