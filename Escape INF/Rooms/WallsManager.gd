extends Node2D

var current_wall_index := 0 setget set_current_wall

onready var walls := get_children()

func _ready():
	
	
	if ProgressManager.previous_wall_index != null:
		if walls.size() >= ProgressManager.previous_wall_index + 1:
			current_wall_index = ProgressManager.previous_wall_index
	
	# Esconde todas as walls e mostra a primeira atual
	for wall in walls:
		wall.hide()
	walls[current_wall_index].show()

func set_current_wall(wall_index):
	
	walls[current_wall_index].hide() # Esconde a wall anterior
	
	if wall_index < 0:
		wall_index = walls.size() - 1 # Vai para a ultima wall
	elif wall_index > walls.size() - 1:
		wall_index = 0 # Vai para a primeira wall
	
	current_wall_index = wall_index # Muda a wall atual
	
	walls[current_wall_index].show() # Mostra a wall atual
