extends RichTextLabel

export (float) var time := 0.05

var done := false setget setDone

onready var icon = $TextureRect
onready var timer = $Timer

func show_text(_text):
	get_parent().mouse_filter = Control.MOUSE_FILTER_STOP # Bloqueio input enquanto mostra texto
	done = false
	icon.hide()
	text = _text
	show()
	visible_characters = 0
	timer.start(time)

func _input(event):
	if visible:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				if not done:
					self.done = true
				elif done:
					hide()
					get_parent().mouse_filter = Control.MOUSE_FILTER_IGNORE # Libero input apos mostrar texto

func _on_Timer_timeout():
	visible_characters += 1
	if visible_characters == get_total_character_count():
		self.done = true

func setDone(value):
	done = value
	if done:
		visible_characters = get_total_character_count()
		icon.show()

func _on_Collectable_collected(item_data: Item):
	var _text = "\n Você colocou  " + item_data.name + " na sua mochila."
	show_text(_text)
