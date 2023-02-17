extends Area2D

var _hovering = false

func _on_BlockProgress_mouse_entered():
	_hovering = true
	Input.set_default_cursor_shape(2)

func _on_BlockProgress_mouse_exited():
	_hovering = false
	Input.set_default_cursor_shape(0)

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			TextBox.show_texts(["Está muito quente aqui! Os servidores estão supraquecendo. É melhor arrumar a temperatura logo."])
			get_tree().set_input_as_handled()
