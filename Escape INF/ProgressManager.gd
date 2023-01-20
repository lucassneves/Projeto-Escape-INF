extends Node

var previous_room: String
var previous_wall_name: String
var previous_wall_index: int

var anxiety = 0 setget set_anxiety
var first_time_anxiety = true

# Para fazer um controle de quais interagiveis ja foram interagidos e portanto nao podem
# ser interagidos novamente

var unlocked_doors := {}

#Para colocar items que precisam de outros objetos para funcionar - como um unlock doors
var unlocked_items := {}

var completed_puzzles := {}

var collected_items := {}

var seen_texts := {}

signal anxiety_changed
signal anxiety_attack

func add_completed_puzzles(room_name, wall_index, puzzle):
	
	if completed_puzzles.has(room_name):
		if completed_puzzles[room_name].has(wall_index):
			completed_puzzles[room_name][wall_index].append(puzzle)
		else:
			completed_puzzles[room_name][wall_index] = [puzzle]
	else:
		completed_puzzles[room_name] = {wall_index : [puzzle]}

func add_unlocked_door(room_name, wall_name):
	
	if unlocked_doors.has(room_name):
		unlocked_doors[room_name].append(wall_name)
	else:
		unlocked_doors[room_name] = [wall_name]

func add_unlocked_item(room_name, wall_name):
	
	if unlocked_items.has(room_name):
		unlocked_items[room_name].append(wall_name)
	else:
		unlocked_items[room_name] = [wall_name]

func add_collected_item(room_name, wall_name, item_data):
	
	if collected_items.has(room_name):
		if collected_items[room_name].has(wall_name):
			collected_items[room_name][wall_name].append(item_data)
		else:
			collected_items[room_name][wall_name] = [item_data]
	else:
		collected_items[room_name] = {wall_name : [item_data]}

func add_seen_texts(room_name, texts):
	
	if seen_texts.has(room_name):
			seen_texts[room_name].append(texts)
	else:
		seen_texts = {room_name : [texts]}

func set_anxiety(value):
	if first_time_anxiety and value > 0:
		TextBox.show_texts(["Acho que mexer nas coisas sem pensar só vai aumentar minha ansiedade... Preciso focar!"])
		first_time_anxiety = false
	anxiety = clamp(value, 0, 100)
	emit_signal("anxiety_changed")
	
	if anxiety == 100:
		TextBox.show_texts(["Você ficou ansioso demais!"])
		emit_signal("anxiety_attack")
