extends Area2D

export(bool) var locked := false
export(String, FILE, "*.tscn") var goto
onready var sprite = get_parent().get_node("Sprite")

var _hovering = false

func _ready():
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	
	if ProgressManager.check_progress("completed_puzzles", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "res://Interactables/Puzzles/SuperComputer/SuperC.tscn"):
		sprite.show()
		ProgressManager.add_unlocked_door(room_file, wall_name)
		
	if ProgressManager.check_progress("unlocked_doors", room_file, wall_name):
		locked = false
		
func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			interact()
			get_tree().set_input_as_handled()

func interact():
	if locked:
		TextBox.show_texts(["A porta está trancada."])
		AudioPlayer.play_audio(preload("res://Audio/SFX/door-locked.wav"), "Sound")
	else:
		var _a = get_tree().change_scene(goto)

func _on_Door_mouse_entered():
	_hovering = true
	Input.set_default_cursor_shape(2)

func _on_Door_mouse_exited():
	_hovering = false
	Input.set_default_cursor_shape(0)
