extends Node2D

var tween: Tween
var in_tween = false
var damage_type: String

func _ready():
	self.visible = false
"""
func _process(delta):
	if((Input.is_action_just_pressed("Mouse_Left_Click"))&&(in_tween == false)):
		use()
"""
func use(tool: String, tool_texture: Texture2D):
	if(in_tween == false):
		$Axe_Sprite.texture = tool_texture
		damage_type = tool
		in_tween = true
		self.visible = true
		self.rotation = 0
		tween = create_tween()
		tween.tween_property(self, 'rotation_degrees', 90, 0.1)
		await tween.finished
		await get_tree().create_timer(0.1).timeout
		self.visible = false
		#self.rotation_degrees = 120
		in_tween = false


func _on_area_2d_area_entered(area):
	if(in_tween == true):
		if(area.get_parent().has_method("take_damage")):
			area.get_parent().take_damage(25, damage_type)


func _on_area_2d_area_exited(area):
	pass # Replace with function body.
