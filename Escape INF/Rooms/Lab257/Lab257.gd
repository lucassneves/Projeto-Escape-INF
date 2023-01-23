extends Node2D

var RAIN_SFX = preload("res://Audio/rain_thunder_loop.wav")

export (bool) var skip_intros = true # Para testar o jogo mais rapidamente

var intro_texts = [
	"Está muito escuro!",
	"Preciso encontrar uma maneira de ligar a energia.",
	"Posso usar a lanterna do celular que está na minha mochila!"
]
onready var screenModulate = $ScreenModulate

func _ready():
	
	AudioPlayer.play_audio(RAIN_SFX, "Sound")
	
	var room_file = get_tree().current_scene.filename
	
	if ProgressManager.check_progress("completed_puzzles", room_file, "Lab257_Wall1", "res://Interactables/Puzzles/ConnectPath/ConnectPath.tscn"):
		screenModulate.color = Color(1,1,1)

	if not skip_intros:
		
		screenModulate.color = Color("0a0a0a") 
		
		if not ProgressManager.check_progress("seen_texts", room_file, null, intro_texts):
			TextBox.show_texts(intro_texts)
		
		ProgressManager.add_seen_texts(room_file, intro_texts)
	
