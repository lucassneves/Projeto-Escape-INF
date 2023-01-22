extends Panel

const MAIN_MENU = preload("res://Interface/MainMenu/MainMenu.tscn")
export (String, FILE, "*.tscn") var tutorial_scene

func _on_PauseMenuRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			show()
			get_tree().paused = true
			
func _on_Resume_pressed():
	hide()
	get_tree().paused = false

func _on_MainMenuButton_pressed():
	get_tree().paused = false
	var _a = get_tree().change_scene_to(MAIN_MENU)
