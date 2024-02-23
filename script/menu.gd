extends Node2D



func _on_quit_button_down():
	get_tree().quit() 


func _on_option_button_down():
	$optionmenu.visible=true



func _on_close_button_down():
	$optionmenu.visible=false
	


func _on_play_button_down():
	get_tree().change_scene_to_file("res://sceene/map$character_customization.tscn")








func _on_check_box_button_down():
	if $optionmenu/ColorRect/graphics/CheckBox.button_pressed==false:
		DisplayServer.window_set_mode(DisplayServer. WINDOW_MODE_FULLSCREEN)
	if $optionmenu/ColorRect/graphics/CheckBox.button_pressed==true:
		DisplayServer.window_set_mode(DisplayServer. WINDOW_MODE_WINDOWED)


func _on_graphicsb_button_down():
	$optionmenu/ColorRect/graphics.visible=true
