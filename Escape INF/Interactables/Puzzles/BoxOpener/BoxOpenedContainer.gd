extends Control

var completed = false

onready var panels = get_children()


func _ready():
	TextBox.show_texts(["Uma folha de papel. Parece ter algo importante escrito ..."])
