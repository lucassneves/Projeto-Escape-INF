extends Control

var completed = false

onready var panels = get_children()

#onready var destinyButton = $TextureRect8

func _ready():
		TextBox.show_texts(["Tem um papel aqui dentro, deve conter algo importante."])
	#get_parent().complete()
		
