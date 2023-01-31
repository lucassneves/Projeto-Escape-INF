extends Area2D

export(bool) var locked := false

var _hovering = false

onready var sprite = get_parent().get_node("Background")

func _on_Block_mouse_entered():
	_hovering = true

func _on_Block_mouse_exited():
	_hovering = false
	
func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			interact()
			get_tree().set_input_as_handled()

func interact():
	if ProgressManager.check_progress("unlocked_items", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall3"):
		TextBox.show_texts(["Agora posso interagir com o supercomputador",
		"Quantas abas do Chrome será que eu consigo abrir? "
		])
		$CollisionShape2D.disabled = true
		sprite.frame=1
	else:
		TextBox.show_texts(["Preciso ligar a internet, para mexer no supercomputador."])

