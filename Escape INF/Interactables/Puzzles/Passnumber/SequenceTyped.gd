extends Control

var completed = false
var aux = 0
var tmp = 1

onready var button = get_children()
onready var up = get_parent().get_node("Keyboard")

func _ready():
	for i in button.size():
		button[i].connect("gui_input", self, "_on_panel_gui_input", [i])
		
func _on_panel_gui_input(event, index):
	if not completed:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			tmp+=1
			button[index].set_action_mode(tmp)
			#print(button[index].get_action_mode())
			aux+=1
			
			if(aux%6==0):
				if check_completion() == true:
					up.frame = 1
					get_parent().complete()
					completed = true
				else:
					for i in button.size():
						TextBox.show_texts(["Não é essa a senha"]) #colocar som em vez de texto
						button[index].set_action_mode(0)
						print(button[index].get_action_mode())

func check_completion():
	if button[9].get_action_mode() == 2:
		if button[2].get_action_mode() == 3:
			if button[1].get_action_mode() == 4: 
				if button[3].get_action_mode() == 5:
					if button[7].get_action_mode() == 6:
						if button[8].get_action_mode() == 7:
							return true
	return false
