extends Light2D

func _ready():
	var _a = Inventory.connect("selected_item_changed", self, "on_selected_item_changed")
	on_selected_item_changed()
	
func on_selected_item_changed():
	if Inventory.items[Inventory.selected_item_index] == null:
		hide()
	elif Inventory.items[Inventory.selected_item_index].name == 'Celular':
		show()
	else:
		hide()

func _input(event):
	if event is InputEventMouseMotion:
		position = get_global_mouse_position()
