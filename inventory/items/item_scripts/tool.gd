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
func use(tool: String, tool_texture: Texture2D, target: Vector2):
	if(in_tween == false):
		$Tool_Sprite.texture = tool_texture
		damage_type = tool
		var direction: int = 1
		if(target.x < self.global_position.x):
			direction = -1
		if((tool == "sword")||(tool == "endSword")):
			in_tween = true
			self.visible = true
			$Tool_Sprite.scale = Vector2(1, 2)
			$Tool_Sprite.position = Vector2(100, 15)
			$Tool_Sprite.rotation_degrees = 90
			self.rotation_degrees = rad_to_deg(get_parent().get_angle_to(target))-60*direction
			tween = create_tween()
			tween.tween_property(self, 'rotation_degrees', rad_to_deg(get_parent().get_angle_to(target))+60*direction, 0.1)
			await tween.finished
			await get_tree().create_timer(0.1).timeout
			self.visible = false
			#self.rotation_degrees = 120
			in_tween = false
		elif(tool == "bludgeon"):
			in_tween = true
			self.visible = true
			$Tool_Sprite.position = Vector2(50, 15)
			$Tool_Sprite.rotation_degrees = 90
			self.rotation_degrees = rad_to_deg(get_parent().get_angle_to(target))-60*direction
			await get_tree().create_timer(0.7).timeout
			tween = create_tween()
			tween.tween_property(self, 'rotation_degrees', rad_to_deg(get_parent().get_angle_to(target))+60*direction, 0.1).set_trans(Tween.TRANS_QUINT)
			await tween.finished
			await get_tree().create_timer(0.3).timeout
			self.visible = false
			#self.rotation_degrees = 120
			in_tween = false
		else:
			$Tool_Sprite.scale = Vector2(direction, 1)
			$Tool_Sprite.position = Vector2(15*direction, -50)
			$Tool_Sprite.rotation_degrees = 0
			in_tween = true
			self.visible = true
			self.rotation = 0
			tween = create_tween()
			tween.tween_property(self, 'rotation_degrees', 90*direction, 0.1)
			await tween.finished
			await get_tree().create_timer(0.1).timeout
			self.visible = false
			#self.rotation_degrees = 120
			in_tween = false
		"""
		in_tween = true
		self.visible = true
		self.rotation_degrees = rad_to_deg(get_parent().get_angle_to(get_global_mouse_position()))-60
		tween = create_tween()
		tween.tween_property(self, 'rotation_degrees', rad_to_deg(get_parent().get_angle_to(get_global_mouse_position()))+60, 0.1)
		await tween.finished
		await get_tree().create_timer(0.1).timeout
		self.visible = false
		#self.rotation_degrees = 120
		in_tween = false
		"""


func _on_area_2d_area_entered(area):
	if(in_tween == true):
		print(area.get_parent().get_name())
		if(damage_type == "bludgeon"):
			if(area.get_parent().has_method("take_damage")):
				area.get_parent().take_damage(45, damage_type)
			return
		if(area.get_parent().has_method("take_damage")):
			if(get_parent().endSword == false):
				area.get_parent().take_damage(25, damage_type)
			elif(get_parent().endSword == true):
				area.get_parent().take_damage(50, damage_type)


func _on_area_2d_area_exited(area):
	pass # Replace with function body.
