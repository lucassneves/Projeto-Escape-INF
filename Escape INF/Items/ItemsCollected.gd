extends Node

# Para fazer um controle de quais itens ja foram coletados e portanto deve ser
# escondido ao entrar na sala novamente

var collected_items := {}

func add_collected_item(room_name, wall_name, item_data):
	
	if collected_items.has(room_name):
		if collected_items[room_name].has(wall_name):
			collected_items[room_name][wall_name].append(item_data)
	else:
		collected_items[room_name] = {wall_name : [item_data]}
