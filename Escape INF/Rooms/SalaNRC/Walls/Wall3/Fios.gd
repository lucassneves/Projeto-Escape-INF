extends Area2D

export(String) var unlocked_name
export(bool) var locked := false
export(Resource) var item_needed

# Metodo nao recomendado para acessar outros nodes
# ver http://kidscancode.org/godot_recipes/4.x/basics/node_communication
onready var wall2_background: Sprite = get_tree().get_current_scene().get_node("Walls/SalaNRC_Wall2/Background")
onready var block = get_tree().get_current_scene().get_node("Walls/SalaNRC_Wall2/Block")

onready var sprite = get_parent().get_node("Background")

var _hovering = false

func _ready():
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name

	if ProgressManager.check_progress("unlocked_items", room_file, wall_name, unlocked_name):
		locked = false
		sprite.frame=0
		
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
			ProgressManager.add_unlocked_item(room_file, wall_name, unlocked_name)
			Inventory.remove_item(item_needed)
			sprite.frame=0
			
			wall2_background.frame = 1
			block.queue_free()
			
			ProgressManager.anxiety -= 10
		else:
			TextBox.show_texts(["Há fios de internet faltando aqui."])
		
