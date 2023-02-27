extends Control

onready var computer = $AnimationTyped
onready var text = $TextoTyped
onready var sprite = $AnimatedSprite
onready var button = $Button

var mouse_left_down

func _ready():
	computer.play("Type") 
	AudioPlayer.play_audio(preload("res://Audio/SFX/to-type.wav"), "Sound")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true
			computer.playback_speed = 8
		elif event.button_index == 1 and not event.is_pressed():
			mouse_left_down = false
			computer.playback_speed = 1

func _on_Button_pressed():
	if computer.current_animation_position >= 18 :
		computer.playback_speed = 1
		text.hide()
		sprite.show()
		sprite.play("happy")

func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and sprite.visible:
		var _a = get_tree().change_scene(ProgressManager.previous_room)

