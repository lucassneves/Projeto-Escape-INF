extends Area2D

export(bool) var locked := false

export(String, FILE, "*.tscn") var goto

var _hovering = false

func _ready():
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	
	if ProgressManager.check_progress("unlocked_doors", room_file, wall_name):
		locked = false

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			interact()
			get_tree().set_input_as_handled()

func interact():
	
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	var wall_index = get_parent().get_parent().current_wall_index
	
	if locked:
		if ProgressManager.check_progress("completed_puzzles", room_file, "SalaNRC_Wall0", "res://Interactables/Puzzles/Passnumber/Passnumber.tscn"):
			locked = false
			ProgressManager.add_unlocked_door(room_file, wall_name)
			ProgressManager.anxiety -= 10
			AudioPlayer.play_audio(preload("res://Audio/SFX/door-unlock2.wav"), "Sound")
		else:
			TextBox.show_texts(["A porta está trancada."])
			AudioPlayer.play_audio(preload("res://Audio/SFX/door-locked.wav"), "Sound")
	else:
		ProgressManager.previous_room = room_file
		ProgressManager.previous_wall_name = wall_name
		ProgressManager.previous_wall_index = wall_index
		var _a = get_tree().change_scene(goto)
		

func _on_Door_mouse_entered():
	_hovering = true

func _on_Door_mouse_exited():
	_hovering = false
