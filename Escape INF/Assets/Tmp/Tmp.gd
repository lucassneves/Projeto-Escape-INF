extends Control

export(String, FILE, "*.tscn") var goto

func _on_Button_pressed():
	var _a = get_tree().change_scene(goto)
