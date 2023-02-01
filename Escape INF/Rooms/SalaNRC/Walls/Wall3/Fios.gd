extends Area2D


export(bool) var locked := false
export(Resource) var item_needed
#onready var uepa = get_node("res://Rooms/SalaNRC/Walls/Wall2/SalaNRC_Wall2.tscn")

onready var sprite = get_parent().get_node("Background")

var _hovering = false

func _ready():
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	
	if ProgressManager.check_progress("unlocked_item", room_file, wall_name, item_needed):
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
	
	if locked:
		if Inventory.items[Inventory.selected_item_index] == item_needed:
			TextBox.show_texts(["Você conectou " + item_needed.name + " ."])
			locked = false
			ProgressManager.add_unlocked_item(room_file, wall_name, item_needed)
			Inventory.remove_item(item_needed)
			sprite.frame=0
			#mudar frame de outra cena
			ProgressManager.anxiety -= 10
		else:
			TextBox.show_texts(["Há fios de internet faltando aqui."])
		
