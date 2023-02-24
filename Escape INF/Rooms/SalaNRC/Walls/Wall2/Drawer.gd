extends Area2D

export(bool) var locked := false
export(Resource) var item_needed

onready var sprite = $Sprite
onready var sprite2 = get_parent().get_node("Sprite")
onready var block_drawer = get_parent().get_node("BlockProgress2")

var _hovering = false
var computer_scene = "res://Interactables/Puzzles/SuperComputer/HappyComputer.tscn"
		
func _on_Drawer_mouse_entered():
	_hovering = true
	Input.set_default_cursor_shape(2)

func _on_Drawer_mouse_exited():
	_hovering = false
	Input.set_default_cursor_shape(0)

func _ready():
	if ProgressManager.check_progress("unlocked_items","res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "Gaveta"):
		sprite.frame=1
		block_drawer.queue_free()
	

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			interact()
			get_tree().set_input_as_handled()
		
func interact():
	if Inventory.get_selected_item() == item_needed:
			Inventory.remove_item(item_needed)
			ProgressManager.add_completed_puzzles("res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "res://Interactables/Puzzles/SuperComputer/SuperC.tscn")
			print("LOG: Puzzle SuperComputer concluído.")
			sprite2.show()
			var _a = get_tree().change_scene(computer_scene)	
