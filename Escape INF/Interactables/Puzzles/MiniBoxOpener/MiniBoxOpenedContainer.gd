extends Control

var completed = false

onready var panels = get_children()

#onready var destinyButton = $TextureRect8

func _ready():
		TextBox.show_texts(["Nossa! é um ingresso..."])
	#get_parent().complete()
		
