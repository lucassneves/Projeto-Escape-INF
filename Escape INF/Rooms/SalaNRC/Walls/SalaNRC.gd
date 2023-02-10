extends Node2D

var intro_texts = [
	"UAU! Consegui entrar, acho que isso já mostra minha competência na computação, vou exigir meu diploma depois dessa.",
	"QUE CALOR !!!!!!!!!",
	"Nessa temperatura não há super computador que aguente"
]

onready var screenModulate = $ScreenModulate

onready var computer: AnimatedSprite = get_tree().get_current_scene().get_node("Walls/SalaNRC_Wall2/AnimatedSprite")

func _ready():

	var room_file = get_tree().current_scene.filename
	
	if not ProgressManager.check_progress("seen_texts", room_file, null, "intro_texts"):
		TextBox.show_texts(intro_texts)
		ProgressManager.add_seen_texts(room_file, "intro_texts")
		
	if ProgressManager.check_progress("unlocked_items", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall3", "Fios"):
		computer.show()
		computer.play("computer")
		
	if ProgressManager.check_progress("completed_puzzles", room_file, "SalaNRC_Wall0", "res://Interactables/Puzzles/AirConditioning/Air.tscn"):
		screenModulate.color = Color("c3d8ff")
		
	else:
		screenModulate.color = Color("ffc3c3") 
