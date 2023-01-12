extends Control

export (String, FILE, "*.tscn") var first_room

var texts = [
	"Zzz...",
	"...",
	"!!!",
	"Acho que dormi demais!",
	"Preciso sair daqui..."
]

func _ready():
	
	var _a = TextBox.connect("texts_done", self, "_on_texts_done")
	
	yield(get_tree().create_timer(1), "timeout") # Espera 1 segundo
	TextBox.show_texts(texts)
	
func _on_texts_done():
	yield(get_tree().create_timer(1), "timeout") # Espera 1 segundo
	var _a = get_tree().change_scene(first_room)
