extends Control

onready var lab257 = $lab257
onready var lab152 = $lab152
onready var lab251 = $lab251
onready var salaSergio = $salaSergio
onready var NRC = $NRC
onready var copa = $copa
onready var secretaria = $secretaria


func _on_Button_pressed():
	if lab257.is_pressed():
		var _a = get_tree().change_scene("res://Rooms/Lab257/Lab257.tscn")
	if salaSergio.is_pressed():
		var _b = get_tree().change_scene("res://Rooms/SalaSergio/Sergio.tscn")
	if NRC.is_pressed():
		var _c = get_tree().change_scene("res://Rooms/SalaNRC/SalaNRC.tscn")
	if lab152.is_pressed():
		var _d = get_tree().change_scene("res://Rooms/Lab152/Lab257.tscn")
	if lab251.is_pressed():
		var _e = get_tree().change_scene("res://Rooms/Lab251/Lab251.tscn")
	if copa.is_pressed():
		var _f = get_tree().change_scene("res://Rooms/Copa/Copa.tscn")
	if secretaria.is_pressed():
		var _g = get_tree().change_scene("res://Rooms/Secretaria/Secretaria.tscn")

