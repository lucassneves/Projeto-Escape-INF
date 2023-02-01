extends Light2D

func _ready():
	var _a = Inventory.connect("selected_item_changed", self, "on_selected_item_changed")
	on_selected_item_changed()
	
func on_selected_item_changed():
	var item = Inventory.get_selected_item()
	if item != null and item.name == 'Celular':
		show()

func _input(event):
	if event is InputEventMouseMotion:
		position = get_global_mouse_position()
