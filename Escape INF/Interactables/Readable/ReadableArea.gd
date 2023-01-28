extends Area2D

export (PackedScene) var readable_scene

var _hovering = false

func _on_ReadableArea_mouse_entered():
	_hovering = true
	
func _on_ReadableArea_mouse_exited():
	_hovering = false

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			AudioPlayer.play_audio(preload("res://Audio/SFX/paper.wav"),"Sound")
			get_tree().get_current_scene().add_child(readable_scene.instance())
			get_tree().set_input_as_handled()





