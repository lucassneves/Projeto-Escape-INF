extends TextureRect

func _on_InventoryRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			get_parent().get_node("Inventory").show()
