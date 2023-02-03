extends Node2D

var RAIN_SFX = preload("res://Audio/rain_thunder_loop.wav")
var SOUNDTRACK = preload("res://Audio/naruto_soundtrack_inf.mp3")
var SOUNDTRACK2 = preload("res://Audio/anime_soundtrack_inf.mp3")

export (bool) var skip_intros = true # Para testar o jogo mais rapidamente

var intro_texts = [
	"Está muito escuro!",
	"Preciso encontrar uma maneira de ligar a energia.",
	"Posso usar a lanterna do celular que está na minha mochila!"
]
onready var screenModulate = $ScreenModulate

func _ready():
	
	#RABeginning_music_naruto_lab_257IN_SFX if changed
	if AudioPlayer.audio_playing == false:
		AudioPlayer.play_audio(SOUNDTRACK2, "Music")
		AudioPlayer.audio_playing()
	
	
	var room_file = get_tree().current_scene.filename
	
	if ProgressManager.check_progress("completed_puzzles", room_file, "Lab257_Wall1", "res://Interactables/Puzzles/ConnectPath/ConnectPath.tscn"):
		screenModulate.color = Color(1,1,1)
	elif not skip_intros:
		screenModulate.color = Color("0a0a0a") 

	if not skip_intros:
		
		if not ProgressManager.check_progress("seen_texts", room_file, null, "intro_texts"):
			TextBox.show_texts(intro_texts)
			ProgressManager.add_seen_texts(room_file, "intro_texts")
	
