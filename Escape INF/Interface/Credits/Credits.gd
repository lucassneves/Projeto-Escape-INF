extends Control

var mouse_left_down = false


onready var animation = $AnimationPlayer

func _ready():
	AudioPlayer.play_audio(preload("res://Audio/game-over.mp3"), "Music")
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true
			animation.playback_speed = 8
		elif event.button_index == 1 and not event.is_pressed():
			mouse_left_down = false
			animation.playback_speed = 1


func _on_QuitButton_pressed():
	get_tree().quit()
