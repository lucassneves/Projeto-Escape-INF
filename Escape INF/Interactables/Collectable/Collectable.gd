extends Area2D

export(Resource) var item_data

onready var sprite := $Sprite

func _ready():
	
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name

	if ProgressManager.collected_items.has(room_file):
		if ProgressManager.collected_items[room_file].has(wall_name):
			if item_data in ProgressManager.collected_items[room_file][wall_name]:
				hide()

func _on_Collectable_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		collect()

func collect():
	print(item_data.name + " coletado!")
	TextBox.show_text("Você colocou " + item_data.name + " na sua mochila.")
	Inventory.add_item(item_data)
	
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	ProgressManager.add_collected_item(room_file, wall_name, item_data)
	
	queue_free()
