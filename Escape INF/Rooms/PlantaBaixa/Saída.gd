extends Node2D

export(String, FILE, "*.tscn") var goto

var intro_texts = [
	"Frase bacana sobre o pátio"
]

func _on_GoBack_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var _a = get_tree().change_scene(goto)
	
func _ready():
	
	var room_file = get_tree().current_scene.filename
	
	if not ProgressManager.check_progress("seen_texts", room_file, null, "intro_texts"):
		TextBox.show_texts(intro_texts)
		ProgressManager.add_seen_texts(room_file, "intro_texts")
