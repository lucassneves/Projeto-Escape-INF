extends Area2D

export (PackedScene) var readable_scene

var _hovering = false

func _on_ReadableArea_mouse_entered():
	_hovering = true
	Input.set_default_cursor_shape(2)
	
func _on_ReadableArea_mouse_exited():
	_hovering = false
	Input.set_default_cursor_shape(0)

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			AudioPlayer.play_audio(preload("res://Audio/SFX/paper.wav"),"Sound")
			get_tree().get_current_scene().add_child(readable_scene.instance())
			get_tree().set_input_as_handled()





