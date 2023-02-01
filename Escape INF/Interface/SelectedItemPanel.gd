extends TextureRect

onready var sprite = $TextureRect

func _on_InventoryRect_selected_item_changed():
	if Inventory.selected_item_index == null:
		sprite.texture = null
	else:
		sprite.texture = Inventory.get_selected_item().sprite
