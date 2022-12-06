extends Area2D

export(bool) var locked := false

export(Resource) var item_needed

export(String, FILE, "*.tscn") var goto

func _on_Door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		interact()
		
func interact():
	if locked:
		if Inventory.items.has(item_needed):
			TextBox.show_text("Você usou " + item_needed.name + " para destrancar a porta.")
			locked = false
		else:
			TextBox.show_text("A porta está trancada.")
	else:
		var _a = get_tree().change_scene(goto)
