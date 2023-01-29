extends Area2D

export(bool) var locked := false
export(Resource) var item_needed

onready var sprite = get_parent().get_node("Background")

var _hovering = false

func _ready():
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	
	if ProgressManager.check_progress("unlocked_item", room_file, wall_name):
		locked = false
		
func _on_Fios_mouse_entered():
	_hovering = true

func _on_Fios_mouse_exited():
	_hovering = false

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			interact()
			get_tree().set_input_as_handled()
		
func interact():
	
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	var wall_index = get_parent().get_parent().current_wall_index
	
	if locked:
		if Inventory.items[Inventory.selected_item_index] == item_needed:
			TextBox.show_texts(["Você conectou " + item_needed.name + " ."])
			locked = false
			ProgressManager.add_unlocked_item(room_file, wall_name)
			Inventory.remove_item(item_needed)
			sprite.frame=0
			ProgressManager.anxiety -= 10
		else:
			TextBox.show_texts(["Há fios de internet faltando aqui."])
		
