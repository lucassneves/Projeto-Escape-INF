extends HBoxContainer

onready var walls_manager = get_tree().get_current_scene().get_node("Walls")

func _on_LeftButtonRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				walls_manager.current_wall_index -= 1

func _on_RightButtonRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				walls_manager.current_wall_index += 1
