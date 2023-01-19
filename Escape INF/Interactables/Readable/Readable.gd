extends Control

export (Array, String) var texts

var _hovering = false

func _ready():
	if not texts.empty():
		TextBox.show_texts(texts)

func _on_Content_mouse_entered():
	_hovering = true

func _on_Content_mouse_exited():
	_hovering = false

func _on_Readable_gui_input(event):
	if not _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			queue_free()
