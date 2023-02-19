extends Node2D

var intro_texts = [
	"UAU! Consegui entrar, acho que isso já mostra minha competência na computação, vou exigir meu diploma depois dessa.",
	"QUE CALOR !!!!!!!!!",
	"Nessa temperatura não há super computador que aguente"
]

onready var screenModulate = $ScreenModulate

onready var computer: AnimatedSprite = get_tree().get_current_scene().get_node("Walls/SalaNRC_Wall2/AnimatedSprite")
onready var computer2: Sprite = get_tree().get_current_scene().get_node("Walls/SalaNRC_Wall2/Sprite")
onready var block = get_tree().get_current_scene().get_node("Walls/SalaNRC_Wall2/Block")
onready var blockProgress: Area2D = get_tree().get_current_scene().get_node("Walls/SalaNRC_Wall2/BlockProgress")
onready var blockProgress2: Area2D = get_tree().get_current_scene().get_node("Walls/SalaNRC_Wall3/BlockProgress")

func _ready():

	var room_file = get_tree().current_scene.filename
	
	if not ProgressManager.check_progress("seen_texts", room_file, null, "intro_texts"):
		TextBox.show_texts(intro_texts)
		ProgressManager.add_seen_texts(room_file, "intro_texts")
		
	if not ProgressManager.check_progress("completed_puzzles", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "res://Interactables/Puzzles/SuperComputer/SuperC.tscn"):
		if ProgressManager.check_progress("unlocked_items", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall3", "Fios"):
			computer.show()
			computer.play("computer")
			block.queue_free()
	
	if ProgressManager.check_progress("completed_puzzles", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "res://Interactables/Puzzles/SuperComputer/SuperC.tscn"):
		computer2.show()
		computer.hide()
		block.queue_free()
	
	if ProgressManager.check_progress("completed_puzzles", room_file, "SalaNRC_Wall0", "res://Interactables/Puzzles/AirConditioning/Air.tscn"):
		screenModulate.color = Color("c3d8ff")
		blockProgress.queue_free()
		blockProgress2.queue_free()
		
		
	else:
		screenModulate.color = Color("ffc3c3") 
