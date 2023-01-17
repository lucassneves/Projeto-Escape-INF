extends Area2D

var selected := false

signal clicked

func _on_Right_mouse_entered():
	selected = true

func _on_Right_mouse_exited():
	selected = false

func _input(event):
	if event is InputEventMouseButton:
		if selected and event.button_index == BUTTON_RIGHT:
			emit_signal("clicked")
