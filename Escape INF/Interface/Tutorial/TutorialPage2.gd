extends Control

export (String, FILE, "*.tscn") var main_menu

func _on_Button_pressed():
	print("here")
	var _b = get_tree().change_scene(main_menu)
