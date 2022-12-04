extends Sprite




func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			print("previous room")
			get_tree().change_scene("res://Scenes/Room1/Room1_4.tscn")

#
