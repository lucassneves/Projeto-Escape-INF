extends Area2D

export (String, FILE, "*.tscn") var puzzle_file

var _hovering = false

onready var area_collision = $CollisionShape2D
onready var sprite = $Sprite

func _ready():
	var room_file = get_tree().current_scene.filename
	var wall_name = get_parent().name
	
	if ProgressManager.check_progress("completed_puzzles", room_file, wall_name, puzzle_file):
		area_collision.disabled = true
		sprite.frame = 1

func _on_PuzzleArea_mouse_entered():
	_hovering = true

func _on_PuzzleArea_mouse_exited():
	_hovering = false

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			ProgressManager.previous_room = get_tree().current_scene.filename
			ProgressManager.previous_wall_name = get_parent().name
			ProgressManager.previous_wall_index = get_tree().current_scene.find_node("Walls").current_wall_index
			var _a = get_tree().change_scene(puzzle_file)
			get_tree().set_input_as_handled()
