extends Control

onready var button1 = $Button
onready var button2 = $Button2


func _on_Button_pressed():
	if button1.is_pressed():
		var _a = get_tree().change_scene("res://Rooms/Lab257/Lab257.tscn")
	if button2.is_pressed():
		var _b = get_tree().change_scene("res://Rooms/SergioOficina/Oficina.tscn")
