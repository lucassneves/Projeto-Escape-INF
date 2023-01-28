extends TextureProgress

onready var animation = $AnimationPlayer

func _ready():
	var _a = ProgressManager.connect("anxiety_changed", self, "set_anxiety")
	value = ProgressManager.anxiety

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		ProgressManager.anxiety += 5
		AudioPlayer.play_audio(preload("res://Audio/SFX/alert.wav"), "Sound")
		animation.play("Shake")

func set_anxiety():
	value = ProgressManager.anxiety

func _on_Timer_timeout():
	ProgressManager.anxiety -= 5
