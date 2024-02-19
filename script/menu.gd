extends Node2D



func _on_quit_button_down():
	get_tree().quit() 


func _on_option_button_down():
	$optionmenu.visible=true



func _on_close_button_down():
	$optionmenu.visible=false
	


func _on_play_button_down():
	get_tree().change_scene_to_file("res://sceene/map$character_customization.tscn")
