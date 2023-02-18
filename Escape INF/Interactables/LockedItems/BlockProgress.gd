extends Area2D

var _hovering = false

export(String, MULTILINE) var needed_text

func _on_BlockProgress_mouse_entered():
	_hovering = true
	Input.set_default_cursor_shape(2)

func _on_BlockProgress_mouse_exited():
	_hovering = false
	Input.set_default_cursor_shape(0)

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			TextBox.show_texts([needed_text])
			get_tree().set_input_as_handled()
