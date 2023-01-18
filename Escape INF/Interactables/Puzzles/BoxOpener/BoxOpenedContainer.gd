extends Control

var completed = false

onready var panels = get_children()

#onready var destinyButton = $TextureRect8

func _ready():
		TextBox.show_texts(['"TOP Secret"', 
						"O experimento funcionou...",
						"Depois de anos trabalhando com Inteligencia Artificial...",
						"O supercomputador está vivo!",
						"... Tomara que dê tudo certo.", 
						"Senha 424242"])
	#get_parent().complete()
		
