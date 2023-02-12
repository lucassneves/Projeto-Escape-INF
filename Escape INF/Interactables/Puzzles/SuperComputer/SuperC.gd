extends Control

onready var computer = $AnimationTyped
onready var text = $TextoTyped
onready var sprite = $AnimatedSprite

func _ready():
	computer.play("Fast") #Type - Fast
	AudioPlayer.play_audio(preload("res://Audio/SFX/to-type.mp3"), "Sound")
	
func _process(_delta):
	if (computer.current_animation_position >= 5): #18
		AudioPlayer.stop_all_audios()
		

func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var _a = get_tree().change_scene(ProgressManager.previous_room)


func _on_Button_pressed():
	if computer.current_animation_position >= 5 : #18
		text.hide()
		sprite.show()
		sprite.play("cry")
			
