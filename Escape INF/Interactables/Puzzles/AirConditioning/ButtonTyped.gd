extends Control

var completed = false

var mode = "Ventilar"
var on = true

onready var sprite = get_parent().get_node("Sprite")

onready var digito1 = $Digito1
onready var digito2 = $Digito2

func check_completion():
	if (digito1.get_text()  == "6"):
		if (digito2.get_text()  == "3"):
			if(mode == "Gelar"):
				$ButtonDown.disabled = true
				$ButtonMode.disabled = true
				$ButtonOff.disabled = true
				$ButtonUp.disabled = true
				
				AudioPlayer.play_audio(preload("res://Audio/SFX/correct-answer.wav"), "Sound")
				get_parent().complete()
				completed = true
				
func _on_ButtonOff_pressed():
	AudioPlayer.play_audio(preload("res://Audio/SFX/click.wav"), "Sound")
	if on:
		digito1.text = ""
		digito2.text = ""
		on = false
	else:
		digito1.text ="4"
		digito2.text ="9"
		on = true
	
func _on_ButtonMode_pressed():
	
	AudioPlayer.play_audio(preload("res://Audio/SFX/click.wav"), "Sound")
	if(mode == "Ventilar"):
		sprite.frame = 1
		mode = "Gelar"
	else:
		sprite.frame = 0
		mode = "Ventilar"
		
	check_completion()
	
func _on_ButtonUp_pressed():

	var novoDigito = int(digito2.text) + 1

	digito2.text = str(novoDigito)

	if digito2.text == "10":
		
		novoDigito = int(digito1.text) + 1
		
		digito1.text = str(novoDigito)
		digito2.text = "0"
		
	check_completion()
			
func _on_ButtonDown_pressed():
	
	var novoDigito = int(digito2.text) - 1
	
	digito2.text = str(novoDigito)
	
	if digito2.text == "-1":
		
		novoDigito = int(digito1.text) - 1
		
		digito1.text = str(novoDigito)
		digito2.text = "9"
		
	check_completion()
		
