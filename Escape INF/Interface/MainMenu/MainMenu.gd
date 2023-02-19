extends Control

export (String, FILE, "*.tscn") var first_scene
export (String, FILE, "*.tscn") var tutorial_scene

var SOUNDTRACK2 = preload("res://Audio/SFX/anime_soundtrack_inf.mp3")

func _ready():	
	if AudioPlayer.audio_playing == false:
		AudioPlayer.play_audio(SOUNDTRACK2, "Music")
		AudioPlayer.audio_playing = true

func _on_PlayButton_pressed():
	var _a = get_tree().change_scene(first_scene)

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_TutorialButton_pressed():
	var _b = get_tree().change_scene(tutorial_scene)
