extends Node2D

#var RAIN_SFX = preload("res://Audio/rain_thunder_loop.wav")
#Can comment if only going to use one audio for all
var SOUNDTRACK = preload("res://Audio/Music_naruto_lab_257.wav")

func _ready():
	#Can comment if only going to use one audio for all
	AudioPlayer.stop_all_audios()
	
	AudioPlayer.play_audio(SOUNDTRACK, "Music")
	
