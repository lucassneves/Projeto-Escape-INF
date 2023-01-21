extends Control

var completed = false

onready var panels = get_children()

#onready var destinyButton = $TextureRect8

func _ready():
		TextBox.show_texts(["O café está muito bom, agora posso continuar o desafio!"])
	#get_parent().complete()
		
