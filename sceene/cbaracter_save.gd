extends Node2D



func _on_button_button_down():
	get_parent().get_parent().get_parent().get_parent().get_node("Character").visible=false
	get_parent().get_parent().get_parent().get_parent().get_node("Map").visible=true
	get_parent().get_parent().get_parent().get_parent().load_map()
	save_state_custom()

func custom_s():
	var custom_s={
		"custom":self.name
	}
	return custom_s
func save_state_custom():
	var save_file=FileAccess.open("res://save/custom.save",FileAccess.WRITE)
	var vardata=self.call("custom_s")
	var json_string=JSON.stringify(vardata)
	save_file.store_line(json_string)
