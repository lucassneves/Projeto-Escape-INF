extends CanvasLayer

export (float) var time := 0.05

var done := true setget setDone

onready var icon = $Control/TextBox/TextureRect
onready var timer = $Control/TextBox/Timer
onready var textLabel = $Control/TextBox/Text

func show_text(_text):
	self.done = false
	icon.hide()
	show()
	textLabel.text = _text
	textLabel.visible_characters = 0
	timer.start(time)

func _input(event):
	if visible:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				get_tree().set_input_as_handled()
				if not done:
					self.done = true
				elif done:
					hide()

func _on_Timer_timeout():
	textLabel.visible_characters += 1
	if textLabel.visible_characters == textLabel.get_total_character_count():
		self.done = true

func setDone(value):
	done = value
	if done:
		textLabel.visible_characters = textLabel.get_total_character_count()
		icon.show()
