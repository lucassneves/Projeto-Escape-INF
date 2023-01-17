extends TextureProgress

var first_time_clicked = false

onready var animation = $AnimationPlayer

func _ready():
	var _a = ProgressManager.connect("anxiety_changed", self, "set_anxiety")
	value = ProgressManager.anxiety

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if not first_time_clicked:
			TextBox.show_texts(["Acho que mexer nas coisas sem pensar só vai aumentar minha ansiedade... Preciso focar!"])
			first_time_clicked = true
		ProgressManager.anxiety += 5
		animation.play("Shake")

func set_anxiety():
	value = ProgressManager.anxiety

func _on_Timer_timeout():
	ProgressManager.anxiety -= 5
