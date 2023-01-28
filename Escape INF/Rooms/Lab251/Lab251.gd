extends Node2D

var SOUNDTRACK = preload("res://Audio/Music_naruto_lab_x.wav")

var intro_texts = [
	"Eita!, como assim a porta trancou?",
	"Essa porta é automática",
	"Dúvido que encontre uma chave por aqui." 
]

func _ready():

	AudioPlayer.stop_all_audios()
	AudioPlayer.play_audio(SOUNDTRACK, "Sound")
	
	var room_file = get_tree().current_scene.filename
	
	if not ProgressManager.check_progress("seen_texts", room_file, null, intro_texts):
		TextBox.show_texts(intro_texts)
		ProgressManager.add_seen_texts(room_file, intro_texts)

