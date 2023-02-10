extends Area2D

export(Resource) var item_data

export (String, FILE, "*.tscn") var puzzle_file

var _hovering = false

onready var sprite := $Sprite

onready var area_collision = $CollisionShape2D

func _ready():
	
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	
	area_collision.disabled = true

	if ProgressManager.check_progress("collected_items", room_file, wall_name, item_data):
		queue_free()
	
	if ProgressManager.check_progress("completed_puzzles", room_file, wall_name, puzzle_file):
		sprite.visible = true
		area_collision.disabled = false
		
func _on_Collectable_mouse_entered():
	_hovering = true

func _on_Collectable_mouse_exited():
	_hovering = false

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			collect()
			get_tree().set_input_as_handled()

func collect():
	print(item_data.name + " coletado!")
	TextBox.show_texts(["Você colocou " + item_data.name + " na sua mochila."])
	Inventory.add_item(item_data)
	
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	ProgressManager.add_collected_item(room_file, wall_name, item_data)
	
	ProgressManager.anxiety -= 10
	
	queue_free()



func _on_Collectable_visibility_changed():
	pass # Replace with function body.
