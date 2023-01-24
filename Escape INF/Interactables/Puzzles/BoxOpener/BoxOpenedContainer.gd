extends Control

var completed = false

onready var panels = get_children()

#onready var destinyButton = $TextureRect8

func _ready():
		TextBox.show_texts(["Uma folha de papel. Deve ter algo importante..."])
	#get_parent().complete()
		
