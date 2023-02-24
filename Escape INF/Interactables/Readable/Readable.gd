extends Control

export (Array, String) var texts

var _hovering = false

func _ready():
	get_parent().layer = 1
	Blur.unfocus_blur()
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
			Blur.visible = false
