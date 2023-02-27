extends Control

onready var computer = $AnimationTyped
onready var text = $TextoTyped
onready var sprite = $AnimatedSprite
onready var sprite2 = $Sprite2
onready var button = $Button

var mouse_left_down

func _ready():
	
	if not ProgressManager.check_progress("completed_puzzles", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "res://Interactables/Puzzles/SuperComputer/SuperC.tscn"):
		computer.play("Type")
		AudioPlayer.play_audio(preload("res://Audio/SFX/to-type.wav"), "Sound")
		
	
	if ProgressManager.check_progress("completed_puzzles", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "res://Interactables/Puzzles/SuperComputer/SuperC.tscn"):
		button.hide()
		text.hide()
		sprite2.show()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true
			computer.playback_speed = 8
		elif event.button_index == 1 and not event.is_pressed():
			mouse_left_down = false
			computer.playback_speed = 1

func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and sprite.visible:
		var _a = get_tree().change_scene(ProgressManager.previous_room)

func _on_Button_pressed():
	if computer.current_animation_position >= 18 :
		computer.playback_speed = 1
		text.hide()
		sprite.show()
		sprite.play("cry")
		ProgressManager.add_unlocked_item("res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "DicaFinal")

