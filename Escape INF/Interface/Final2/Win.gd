extends Node2D

export (String, FILE, "*.tscn") var next_scene

func _ready():
	AudioPlayer.stop_all_audios()
	AudioPlayer.play_audio(preload("res://Audio/SFX/win.wav"), "Sound")
	yield(get_tree().create_timer(5), "timeout") 
	var _a = get_tree().change_scene(next_scene)
