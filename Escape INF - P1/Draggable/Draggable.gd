extends Area2D

var selected := false
var dragging := false

func _on_Draggable_mouse_entered():
	selected = true
	
func _on_Draggable_mouse_exited():
	selected = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			
			if selected:
				if not dragging and event.pressed:
					dragging = true
			
			if dragging and not event.pressed:
				dragging = false
				
	if event is InputEventMouseMotion and dragging:
		position = event.position
