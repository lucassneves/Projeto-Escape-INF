extends Control

onready var computer = $AnimationTyped
onready var text = $TextoTyped
onready var sprite = $AnimatedSprite
onready var sprite2 = $Sprite2
onready var button = $Button

func _ready():
	
	if not ProgressManager.check_progress("completed_puzzles", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "res://Interactables/Puzzles/SuperComputer/SuperC.tscn"):
		computer.play("Type")
		AudioPlayer.play_audio(preload("res://Audio/SFX/to-type.wav"), "Sound")
	
	if ProgressManager.check_progress("completed_puzzles", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "res://Interactables/Puzzles/SuperComputer/SuperC.tscn"):
		button.hide()
		text.hide()
		sprite2.show()

func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and computer.current_animation_position >= 18 :
		var _a = get_tree().change_scene(ProgressManager.previous_room)


func _on_Button_pressed():
	if computer.current_animation_position >= 18 :
		text.hide()
		sprite.show()
		sprite.play("cry")
			
