extends Control

export (String, FILE, "*.tscn") var first_scene

func _on_PlayButton_pressed():
	var _a = get_tree().change_scene(first_scene)

func _on_QuitButton_pressed():
	get_tree().quit()
