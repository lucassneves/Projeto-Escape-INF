extends Area2D

export(bool) var locked := false

export(Resource) var item_needed

export(String, FILE, "*.tscn") var goto

func _ready():
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name

	if ProgressManager.unlocked_doors.has(room_file):
		if ProgressManager.unlocked_doors[room_file].has(wall_name):
			locked = false

func _on_Door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		interact()
		
func interact():
	
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	var wall_index = get_parent().get_parent().current_wall_index
	
	if locked:
		if Inventory.items.has(item_needed):
			TextBox.show_text("Você usou " + item_needed.name + " para destrancar a porta.")
			locked = false
			ProgressManager.add_unlocked_door(room_file, wall_name)
		else:
			TextBox.show_text("A porta está trancada.")
	else:
		ProgressManager.previous_room = room_file
		ProgressManager.previous_wall_name = wall_name
		ProgressManager.previous_wall_index = wall_index
		var _a = get_tree().change_scene(goto)
