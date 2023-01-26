extends Control

onready var panels = get_children()

var numero1 = "_"
var numero2 = "_"
var numero3 = "_"
var numero4 = "_"
var ok = false
var completed = false

var proximo = 1

func _process(delta):
	
	$Numero1.text = numero1
	$Numero2.text = numero2
	$Numero3.text = numero3
	$Numero4.text = numero4
	
	$Proximo.text = str(proximo)

func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var _a = get_tree().change_scene(ProgressManager.previous_room)

func _on_Botao1_pressed():

	if proximo == 1:
		numero1 = "1"
	if proximo == 2:
		numero2 = "1"
	if proximo == 3:
		numero3 = "1"
	if proximo == 4:
		numero4 = "1"
	proximo += 1
	
	if proximo > 5:
		proximo = 5

func _on_Botao2_pressed():
	
	if proximo == 1:
		numero1 = "2"
	if proximo == 2:
		numero2 = "2"
	if proximo == 3:
		numero3 = "2"
	if proximo == 4:
		numero4 = "2"
	proximo += 1
	
	if proximo > 5:
		proximo = 5
	
func _on_Botao3_pressed():
	
	if proximo == 1:
		numero1 = "3"
	if proximo == 2:
		numero2 = "3"
	if proximo == 3:
		numero3 = "3"
	if proximo == 4:
		numero4 = "3"
	proximo += 1
	
	if proximo > 5:
		proximo = 5

func _on_Botao4_pressed():
	
	if proximo == 1:
		numero1 = "4"
	if proximo == 2:
		numero2 = "4"
	if proximo == 3:
		numero3 = "4"
	if proximo == 4:
		numero4 = "4"
	proximo += 1
	
	if proximo > 5:
		proximo = 5

func _on_Botao5_pressed():
	
	if proximo == 1:
		numero1 = "5"
	if proximo == 2:
		numero2 = "5"
	if proximo == 3:
		numero3 = "5"
	if proximo == 4:
		numero4 = "5"
	proximo += 1
	
	if proximo > 5:
		proximo = 5
	
func _on_Botao6_pressed():
	
	if proximo == 1:
		numero1 = "6"
	if proximo == 2:
		numero2 = "6"
	if proximo == 3:
		numero3 = "6"
	if proximo == 4:
		numero4 = "6"
	proximo += 1
	
	if proximo > 5:
		proximo = 5

func _on_Botao7_pressed():
	
	if proximo == 1:
		numero1 = "7"
	if proximo == 2:
		numero2 = "7"
	if proximo == 3:
		numero3 = "7"
	if proximo == 4:
		numero4 = "7"
	proximo += 1
	
	if proximo > 5:
		proximo = 5

func _on_Botao8_pressed():
	
	if proximo == 1:
		numero1 = "8"
	if proximo == 2:
		numero2 = "8"
	if proximo == 3:
		numero3 = "8"
	if proximo == 4:
		numero4 = "8"
	proximo += 1
	
	if proximo > 5:
		proximo = 5

func _on_Botao9_pressed():
	
	if proximo == 1:
		numero1 = "9"
	if proximo == 2:
		numero2 = "9"
	if proximo == 3:
		numero3 = "9"
	if proximo == 4:
		numero4 = "9"
	proximo += 1
	
	if proximo > 5:
		proximo = 5

func _on_BotaoEnter_pressed():
	if proximo == 5:
		if numero1 == "3":
			if numero2 == "4":
				if numero3 == "2":
					if numero4 == "3":
						numero1 = "2"
						ok = true
						get_parent().complete()
						
	if proximo == 5 and ok == false:
		numero1 = "_"
		numero2 = "_"
		numero3 = "_"
		numero4 = "_"
		proximo = 1


