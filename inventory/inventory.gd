extends Resource

class_name Inv

@export var slots: Array[InvSlot]

func insert(item: InvItem, amount: int):
	for i in range(slots.size()):
		if(slots[i].amount > 0):
			if((slots[i].item.id == item.id)&&(slots[i].amount < 99)):
				slots[i].amount += amount
				return i
	
	for i in range(slots.size()):
		if(slots[i].amount == 0):
			slots[i].item = item
			slots[i].amount = amount
			return i
	return -1

func insert_at(i: int, item: InvItem, amount: int):
	if(slots[i].amount == 0):
		slots[i].item = item
		slots[i].amount = amount
	elif((slots[i].item.id == item.id)&&(slots[i].amount < 99)):
		slots[i].amount += amount
