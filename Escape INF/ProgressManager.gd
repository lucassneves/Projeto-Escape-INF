extends Node

var previous_room: String
var previous_wall_name: String
var previous_wall_index: int

var anxiety = 0 setget set_anxiety

# Para fazer um controle de quais interagiveis ja foram interagidos e portanto nao podem
# ser interagidos novamente

var unlocked_doors := {}

var completed_puzzles := {}

var collected_items := {}

signal anxiety_changed
signal anxiety_attack

func add_completed_puzzles(room_name, wall_index, puzzle):
	
	if completed_puzzles.has(room_name):
		if completed_puzzles[room_name].has(wall_index):
			completed_puzzles[room_name][wall_index].append(puzzle)
	else:
		completed_puzzles[room_name] = {wall_index : [puzzle]}

func add_unlocked_door(room_name, wall_name):
	
	if unlocked_doors.has(room_name):
		unlocked_doors[room_name].append(wall_name)
	else:
		unlocked_doors[room_name] = [wall_name]

func add_collected_item(room_name, wall_name, item_data):
	
	if collected_items.has(room_name):
		if collected_items[room_name].has(wall_name):
			collected_items[room_name][wall_name].append(item_data)
	else:
		collected_items[room_name] = {wall_name : [item_data]}

func set_anxiety(value):
	anxiety = clamp(value, 0, 100)
	emit_signal("anxiety_changed")
	
	if anxiety == 100:
		TextBox.show_text("Você ficou ansioso demais!")
		emit_signal("anxiety_attack")
