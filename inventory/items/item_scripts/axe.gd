extends Node2D

var tween
var in_tween = false

func _ready():
	self.visible = false
"""
func _process(delta):
	if((Input.is_action_just_pressed("Mouse_Left_Click"))&&(in_tween == false)):
		use()
"""
func use():
	if(in_tween == false):
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