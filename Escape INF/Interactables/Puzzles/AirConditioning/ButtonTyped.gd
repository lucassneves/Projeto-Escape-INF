extends Control

var completed = false
onready var digito1 = $Digito1
onready var digito2 = $Digito2

var numeros = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
var turn = 0
var turn2 = 0 

onready var button = get_children()
onready var sprite = get_parent().get_node("Sprite")

func _ready():
	digito1.set_text("5")
	digito2.set_text("2")

func check_completion():
	if (digito1.get_text()  == "6"):
		if (digito2.get_text()  == "3"):
			if(turn == 1):
				$ButtonDown.disabled = true
				$ButtonMode.disabled = true
				$ButtonOff.disabled = true
				$ButtonUp.disabled = true
				return true
				
	return false

func _on_ButtonOff_pressed():
	AudioPlayer.play_audio(preload("res://Audio/SFX/click.wav"), "Sound")
	if(turn2 == 0):
		digito1=""
		digito2=""
		turn2 = 1
	else:
		digito1="4"
		digito2="9"
		turn2 = 0
	
func _on_ButtonMode_pressed():
	AudioPlayer.play_audio(preload("res://Audio/SFX/click.wav"), "Sound")
	if(turn == 0):
		sprite.frame = 1
		turn = 1
	else:
		sprite.frame = 0
		turn = 0
	
func _on_ButtonUp_pressed():
	while(1):
		
		if check_completion() == true:
			AudioPlayer.play_audio(preload("res://Audio/SFX/correct-answer.wav"), "Sound")
			get_parent().complete()
			completed = true
			
		if (digito2.get_text() == "0"):
			digito2.set_text("1")
			break;
		if (digito2.get_text() == "1"):
			digito2.set_text("2")
			break;			
		if (digito2.get_text() == "2"):
			digito2.set_text("3")
			break;
		if (digito2.get_text() == "3"):
			digito2.set_text("4")
			break;
		if (digito2.get_text() == "4"):
			digito2.set_text("5")
			break;
		if (digito2.get_text() == "5"):
			digito2.set_text("6")
			break;
		if (digito2.get_text() == "6"):
			digito2.set_text("7")
			break;
		if (digito2.get_text() == "7"):
			digito2.set_text("8")
			break;
		if (digito2.get_text() == "8"):
			digito2.set_text("9")
			break;
		if (digito2.get_text() == "9"):
			digito2.set_text("0")		
			if (digito1.get_text() == "0"):
				digito1.set_text("1")
				break;
			if (digito1.get_text() == "1"):
				digito1.set_text("2")
				break;			
			if (digito1.get_text() == "2"):
				digito1.set_text("3")
				break;
			if (digito1.get_text() == "3"):
				digito1.set_text("4")
				break;
			if (digito1.get_text() == "4"):
				digito1.set_text("5")
				break;
			if (digito1.get_text() == "5"):
				digito1.set_text("6")
				break;
			if (digito1.get_text() == "6"):
				digito1.set_text("7")
				break;
			if (digito1.get_text() == "7"):
				digito1.set_text("8")
				break;
			if (digito1.get_text() == "8"):
				digito1.set_text("9")
				break;
			if (digito2.get_text() == "9"):
				digito2.set_text("0")			
			break;
			
func _on_ButtonDown_pressed():
	while(1):
		
		if check_completion() == true:
			AudioPlayer.play_audio(preload("res://Audio/SFX/correct-answer.wav"), "Sound")
			get_parent().complete()
			completed = true
			
		if (digito2.get_text() == "1"):
			digito2.set_text("0")
			break;
		if (digito2.get_text() == "2"):
			digito2.set_text("1")
			break;			
		if (digito2.get_text() == "3"):
			digito2.set_text("2")
			break;
		if (digito2.get_text() == "4"):
			digito2.set_text("3")
			break;
		if (digito2.get_text() == "5"):
			digito2.set_text("4")
			break;
		if (digito2.get_text() == "6"):
			digito2.set_text("5")
			break;
		if (digito2.get_text() == "7"):
			digito2.set_text("6")
			break;
		if (digito2.get_text() == "8"):
			digito2.set_text("7")
			break;
		if (digito2.get_text() == "9"):
			digito2.set_text("8")
			break;
		if (digito2.get_text() == "0"):
			digito2.set_text("9")		
			if (digito1.get_text() == "0"):
				digito1.set_text("1")
				break;
			if (digito1.get_text() == "1"):
				digito1.set_text("0")
				break;			
			if (digito1.get_text() == "2"):
				digito1.set_text("1")
				break;
			if (digito1.get_text() == "3"):
				digito1.set_text("2")
				break;
			if (digito1.get_text() == "4"):
				digito1.set_text("3")
				break;
			if (digito1.get_text() == "5"):
				digito1.set_text("4")
				break;
			if (digito1.get_text() == "6"):
				digito1.set_text("5")
				break;
			if (digito1.get_text() == "7"):
				digito1.set_text("6")
				break;
			if (digito1.get_text() == "8"):
				digito1.set_text("7")
				break;
			if (digito2.get_text() == "9"):
				digito2.set_text("0")			
			break;
	
