extends Control

func _ready():
		TextBox.show_texts(["Muito estranho esses números nas embalagens, será que queira me dizer algo???"])
	#get_parent().complete()
		
func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var _a = get_tree().change_scene(ProgressManager.previous_room)
