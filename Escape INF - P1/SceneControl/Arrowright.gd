extends Sprite




func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			print("next room")
			get_tree().change_scene("res://Scenes/Rooms/Room" +str(int(get_tree().current_scene.name)+1)+".tscn")
			#("res://Scenes/Mundo" + str(int(get_tree().current_scene.name)+1)+".tscn")

#
