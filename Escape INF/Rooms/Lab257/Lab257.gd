extends Node2D

export (bool) var skip_intros = true # Para testar o jogo mais rapidamente

var intro_texts = [
	"Está muito escuro!",
	"Preciso encontrar uma maneira de ligar a energia.",
	"Posso usar a lanterna do celular que está na minha mochila!"
]
onready var screenModulate = $ScreenModulate

func _ready():
	
	var room_file = get_tree().current_scene.filename
	
	if ProgressManager.completed_puzzles.has(room_file):
		if ProgressManager.completed_puzzles[room_file].has("Lab257_Wall1"):
			if "res://Interactables/Puzzles/ConnectPath/ConnectPath.tscn" in ProgressManager.completed_puzzles[room_file]["Lab257_Wall1"]:
				screenModulate.color = Color(1,1,1)
	
	if ProgressManager.seen_texts.has(room_file):
			if intro_texts in ProgressManager.seen_texts[room_file]:
				return
		
	if not skip_intros:
		
		screenModulate.color = Color("0a0a0a") 
		
		TextBox.show_texts(intro_texts)
		
		ProgressManager.add_seen_texts(room_file, intro_texts)
	
