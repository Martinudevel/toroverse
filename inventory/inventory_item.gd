extends Resource

class_name InvItem

@export var name: String = ""
@export var texture: Texture2D
@export var id: int

func left_click(player:CharacterBody2D):
	player.use_item_left(id)

func right_click(player:CharacterBody2D):
	player.use_item_right(id)
