extends Node2D

var SOUNDTRACK = preload("res://Audio/Music_naruto_lab_x.wav")
export(String, FILE, "*.tscn") var goto

var intro_texts = [
	"Já que estou aqui mesmo, será que consigo entrar na sala do supercomputador?"
]

func _ready():

	AudioPlayer.stop_all_audios()
	AudioPlayer.play_audio(SOUNDTRACK, "Music")
	
	var room_file = get_tree().current_scene.filename
	
	if not ProgressManager.check_progress("seen_texts", room_file, null, intro_texts):
		TextBox.show_texts(intro_texts)
		ProgressManager.add_seen_texts(room_file, intro_texts)

func _on_GoBack_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var _a = get_tree().change_scene(goto)