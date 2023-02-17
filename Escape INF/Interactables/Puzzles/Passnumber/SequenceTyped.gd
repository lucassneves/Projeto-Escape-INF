extends Control

var completed = false
var aux = 0
var tmp = 1

onready var button = get_children()
onready var light = get_parent().get_node("Keyboard")

func _ready():
	light.frame = 0
	for i in button.size():
		button[i].connect("gui_input", self, "_on_panel_gui_input", [i])
		
func _on_panel_gui_input(event, index):
	if not completed:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and not light.get_node("AnimationPlayer").is_playing():
			tmp+=1
			AudioPlayer.play_audio(preload("res://Audio/SFX/click.wav"), "Sound")
			button[index].set_action_mode(tmp)
			aux+=1
			light.frame += 1
			
			if(aux%6==0):
				if check_completion() == true:
					light.get_node("AnimationPlayer").play("Correct")
					AudioPlayer.play_audio(preload("res://Audio/SFX/correct-answer.wav"), "Sound")
					get_parent().complete()
					completed = true
				else:
					light.get_node("AnimationPlayer").play("Wrong")
					for i in button.size():
						AudioPlayer.play_audio(preload("res://Audio/SFX/alert.wav"), "Sound")
						button[index].set_action_mode(0)
						tmp=1
					print("LOG: Puzzle PassnumberNRC incorreto.")

func check_completion():
	if button[9].get_action_mode() == 2:
		if button[2].get_action_mode() == 3:
			if button[1].get_action_mode() == 4: 
				if button[3].get_action_mode() == 5:
					if button[7].get_action_mode() == 6:
						if button[8].get_action_mode() == 7:
							return true
	return false
