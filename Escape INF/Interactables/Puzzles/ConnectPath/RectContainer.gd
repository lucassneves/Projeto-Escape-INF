extends Control

var completed = false

onready var panels = get_children()

onready var destinyButton = $TextureRect8

func _ready():
	for i in panels.size():
		panels[i].connect("gui_input", self, "_on_panel_gui_input", [i])
	randomize_rotations()
		
func _on_panel_gui_input(event, index):
	if not completed:
		if index != 7 and index != 12:
			if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
				panels[index].rect_rotation += 90
				if panels[index].rect_rotation > 270:
					panels[index].rect_rotation = 0
				
				if check_completion() == true:
					destinyButton.texture = load("res://Interactables/Puzzles/ConnectPath/greenLight.png")
					get_parent().complete()
					completed = true

func randomize_rotations():
	
	randomize()
	
	var values = [0,90,180,270]
	
	for i in panels.size():
		if i != 7 and i != 12:
			panels[i].rect_rotation = values[randi() % values.size()]

func check_completion():
	for i in panels.size():
		if panels[i].rect_rotation == 0:
			if i in [1,2,3,4,5,9,10,11,13,15]:
				return false
		if panels[i].rect_rotation == 90:
			if i in [0,4,8,10,13,14,15]:
				return false
		if panels[i].rect_rotation == 180:
			if i in [0,1,2,3,4,5,6,8,9,10,11,13]:
				return false
		if panels[i].rect_rotation == 270:
			if i in [0,3,6,9,11,14,15]:
				return false
	return true
