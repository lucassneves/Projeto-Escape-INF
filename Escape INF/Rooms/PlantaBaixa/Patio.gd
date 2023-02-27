extends Node2D

export(String, FILE, "*.tscn") var goto

var intro_texts = [
	"Que pena, fecharam a passagem por conta do telhado que foi danificado.",
	"Não há nada nesse ambiente que me ajude a sair daqui.",
	"Melhor continuar minha jornada, tenho que chegar o tempo do churrasco."
]

func _on_GoBack_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var _a = get_tree().change_scene(goto)
	
func _ready():
	
	var room_file = get_tree().current_scene.filename
	
	if not ProgressManager.check_progress("seen_texts", room_file, null, "intro_texts"):
		TextBox.show_texts(intro_texts)
		ProgressManager.add_seen_texts(room_file, "intro_texts")
