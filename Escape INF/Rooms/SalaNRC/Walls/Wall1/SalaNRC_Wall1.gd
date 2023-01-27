extends Node2D

onready var teste = $Background

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(3):
		teste.frame = i
		print(i)

