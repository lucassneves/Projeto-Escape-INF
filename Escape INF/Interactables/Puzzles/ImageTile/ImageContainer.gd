extends Control

var completed = false

onready var panels = get_children()

onready var destinyButton = $TextureRect8

var first_panel

func _ready():
	for i in panels.size():
		panels[i].connect("gui_input", self, "_on_panel_gui_input", [i])
	randomize_position()

		
func _on_panel_gui_input(event, index):
	if not completed:
			if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
				print(index)
				if first_panel == null:
					first_panel = index
				if first_panel != null and index != first_panel:
					var second_panel
					var second_panel_position
					second_panel = index
					second_panel_position = panels[second_panel].rect_position
					panels[second_panel].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = second_panel_position
					first_panel = null
					second_panel = null
					
				
				
				if check_completion() == true:
#					destinyButton.texture = load("res://Interactables/Puzzles/ConnectPath/greenLight.png")
					get_parent().complete()
					completed = true

func randomize_position():
	
	randomize()
	
	var values = [Vector2(-9,-12), Vector2(24,-12), Vector2(57,-12), Vector2(90,-12), 
	Vector2(-9,21), Vector2(24,21), Vector2(57,21), Vector2(90,21),
	Vector2(-9,54), Vector2(24,54), Vector2(57,54), Vector2(90,54),
	Vector2(-9,87), Vector2(24,87), Vector2(57,87), Vector2(90,87)]
	
	for i in panels.size():
		var random_index
		random_index = randi() % values.size()
		panels[i].rect_position = values[random_index]
		values.erase(values[random_index])
		

func check_completion():
	var values = [Vector2(-9,-12), Vector2(24,-12), Vector2(57,-12), Vector2(90,-12), 
	Vector2(-9,21), Vector2(24,21), Vector2(57,21), Vector2(90,21),
	Vector2(-9,54), Vector2(24,54), Vector2(57,54), Vector2(90,54),
	Vector2(-9,87), Vector2(24,87), Vector2(57,87), Vector2(90,87)]
	
	var contador = 0
	
	for i in panels.size():		
		if panels[i].rect_position == values[i]:
	
			contador +=1
		if contador == 16:
			print("completed")
			return true
