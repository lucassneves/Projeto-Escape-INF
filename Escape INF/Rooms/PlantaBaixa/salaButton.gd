extends Button

export(String) var nome
export(PackedScene) var sala_destino

func _ready():
	var _a = connect("pressed", self, "on_button_pressed")
	
func on_button_pressed():
	var _a = get_tree().change_scene_to(sala_destino)
