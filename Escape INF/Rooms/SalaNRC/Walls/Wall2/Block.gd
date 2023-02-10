extends Area2D

var _hovering = false

func _on_Block_mouse_entered():
	_hovering = true
	Input.set_default_cursor_shape(2)

func _on_Block_mouse_exited():
	_hovering = false
	Input.set_default_cursor_shape(0)

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			TextBox.show_texts(["Preciso ligar a internet, para mexer no supercomputador.", "Acho que vi fios faltando ali."])
			get_tree().set_input_as_handled()

