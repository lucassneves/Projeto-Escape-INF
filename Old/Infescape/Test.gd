extends Node2D

func _input(event):
	if event is InputEvent and Input.is_action_just_pressed("ui_cancel"):
		var _a = get_tree().reload_current_scene()
