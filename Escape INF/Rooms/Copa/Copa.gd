extends Node2D

onready var screenModulate = $ScreenModulate

func _ready():
	
	var room_file = get_tree().current_scene.filename
	
	if ProgressManager.completed_puzzles.has(room_file):
		if ProgressManager.completed_puzzles[room_file].has("Copa_Wall0"):
			if "res://Interactables/Puzzles/CopaPuzzle/PainelMicroondas.tscn" in ProgressManager.completed_puzzles[room_file]["Copa_Wall0"]:
				screenModulate.color = Color(1,1,1)
	
