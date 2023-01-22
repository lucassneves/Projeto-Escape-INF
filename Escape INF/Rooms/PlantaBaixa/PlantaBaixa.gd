extends Control

var salas = null

onready var labelNomeSala = $LabelNomeSalas
onready var salasControl = $Salas

func _ready():
	labelNomeSala.text = ""
	
	salas = salasControl.get_children()
	for i in range(salas.size()):
		salas[i].connect("mouse_entered", self, "on_sala_mouse_entered", [i])
		salas[i].connect("mouse_exited", self, "on_sala_mouse_exited")
		
func on_sala_mouse_entered(index):
	labelNomeSala.text = salas[index].nome
	
func on_sala_mouse_exited():
	labelNomeSala.text = ""
