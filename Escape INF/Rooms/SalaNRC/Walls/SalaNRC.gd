extends Node2D

var intro_texts = [
	"UAU! Consegui entrar, acho que isso já mostra minha competência na computação, vou exigir meu diploma depois dessa.",
	"QUE CALOR !!!!!!!!!",
	"Nessa temperatura não há super computador que aguente"
]

onready var screenModulate = $ScreenModulate

func _ready():

	var room_file = get_tree().current_scene.filename
	
	if not ProgressManager.check_progress("seen_texts", room_file, null, intro_texts):
		TextBox.show_texts(intro_texts)
		ProgressManager.add_seen_texts(room_file, intro_texts)
		
	if ProgressManager.check_progress("completed_puzzles", room_file, "SalaNRC_Wall0", "res://Interactables/Puzzles/AirConditioning/Air.tscn"):
		screenModulate.color = Color("82adff")
	else:
		screenModulate.color = Color("f66c6c") 
