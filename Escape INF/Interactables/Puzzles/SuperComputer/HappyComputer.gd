extends Control

onready var computer = $AnimationTyped
onready var text = $TextoTyped
onready var sprite = $AnimatedSprite
onready var button = $Button

func _ready():
	computer.play("Type") 
	AudioPlayer.play_audio(preload("res://Audio/SFX/to-type.wav"), "Sound")


func _on_Button_pressed():
	if computer.current_animation_position >= 18 :
		text.hide()
		sprite.show()
		sprite.play("happy")

func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and computer.current_animation_position >= 18 :
		var _a = get_tree().change_scene(ProgressManager.previous_room)

