extends TextureRect

onready var sprite = $TextureRect

func _on_InventoryRect2_selected_item_changed():
	var item = Inventory.items[Inventory.selected_item_index]
	if item == null:
		sprite.texture = null
	else:
		sprite.texture = item.sprite
