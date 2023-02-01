extends Area2D

var _hovering = false

func _on_Block_mouse_entered():
	_hovering = true

func _on_Block_mouse_exited():
	_hovering = false

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			TextBox.show_texts(["Preciso ligar a internet, para mexer no supercomputador."])
			get_tree().set_input_as_handled()

