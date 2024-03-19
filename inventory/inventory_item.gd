extends Resource

class_name InvItem

@export var name: String = ""
@export var texture: Texture2D
@export var id: int
@export var stackable: bool = true

func left_click(player:CharacterBody2D):
	match id:
		0:
			print("use")
		1:
			player.use_tool("axe", texture)
		2:
			player.use_tool("pickaxe", texture)
		5:
			player.use_tool("sword", texture)
		6:
			player.use_tool("endSword", texture)

func right_click(player:CharacterBody2D):
	player.use_item_right(id)
