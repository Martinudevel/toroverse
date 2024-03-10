extends StaticBody2D
@export var inv_item: InvItem

var speed = 1.0
var range = 5.0
var magnet = false
var magnet_body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((magnet == true)&&(magnet_body != null)):
		var new_pos = self.position
		if(self.position.x < magnet_body.position.x - range):
			new_pos.x += speed
		elif(self.position.x > magnet_body.position.x + range):
			new_pos.x -= speed
		if(self.position.y < magnet_body.position.y - range):
			new_pos.y += speed
		elif(self.position.y > magnet_body.position.y + range):
			new_pos.y -= speed
		if((new_pos == self.position)&&(magnet == true)):
			magnet_body.acquire_item(self)
		else:
			self.position = new_pos

func magnetised(player: CharacterBody2D):
	magnet = true
	magnet_body = player
