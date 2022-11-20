extends Area2D

var selected := false

signal clicked

func _on_Left_mouse_entered():
	selected = true

func _on_Left_mouse_exited():
	selected = false

func _input(event):
	if event is InputEventMouseButton:
		if selected and event.button_index == BUTTON_LEFT:
			emit_signal("clicked")
