extends Node2D

export (bool) var skip_intros = true # Para testar o jogo mais rapidamente

onready var blockProgress: Area2D = get_tree().get_current_scene().get_node("Walls/Lab257_Wall2/BlockProgress")

var intro_texts = [
	"Está muito escuro!",
	"Preciso encontrar uma maneira de ligar a energia.",
	"Posso usar a lanterna do celular que está na minha mochila!"
]
onready var screenModulate = $ScreenModulate

func _ready():
	
	var room_file = get_tree().current_scene.filename
	
	if ProgressManager.check_progress("completed_puzzles", room_file, "Lab257_Wall1", "res://Interactables/Puzzles/ConnectPath/ConnectPath.tscn"):
		screenModulate.color = Color(1,1,1)
		blockProgress.queue_free()
	elif not skip_intros:
		screenModulate.color = Color("0a0a0a") 

	if not skip_intros:
		
		if not ProgressManager.check_progress("seen_texts", room_file, null, "intro_texts"):
			TextBox.show_texts(intro_texts)
			ProgressManager.add_seen_texts(room_file, "intro_texts")
	
