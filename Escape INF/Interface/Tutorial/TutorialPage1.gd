extends Control

export (String, FILE, "*.tscn") var tutorial_scene2

func _on_Button_pressed():
	var _b = get_tree().change_scene(tutorial_scene2)
