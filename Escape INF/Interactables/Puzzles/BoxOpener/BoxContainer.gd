extends Control

var completed = false

onready var panels = get_children()

onready var destinyButton = $TextureRect8

var first_panel
var counter = 0
var global_index

func _ready():
	for i in panels.size():
		panels[i].connect("gui_input", self, "_on_panel_gui_input", [i])


		
func _on_panel_gui_input(event, index):
	if not completed:
			
			if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:			
				
				if index == 9:
					var switcher
					first_panel = index
					switcher = panels[0].rect_position
					panels[0].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = switcher
					first_panel = null
					switcher = null
				
				elif index == 19:
					var switcher
					first_panel = index
					switcher = panels[10].rect_position
					panels[10].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = switcher
					first_panel = null
					switcher = null
					
				elif index == 29:
					var switcher
					first_panel = index
					switcher = panels[20].rect_position
					panels[20].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = switcher
					first_panel = null
					switcher = null	
				
				elif first_panel==null:
					var switcher
					first_panel = index
					print(first_panel)
					switcher = panels[index+1].rect_position
					panels[index+1].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = switcher
					first_panel = null
					switcher = null

						
				
				
				if check_completion() == true:
					get_parent().complete()
					completed = true


func check_completion():
	var values = [Vector2(-7,30), Vector2(44,30), Vector2(93,30)] 

	print(panels[4].rect_position)
	print(panels[10].rect_position)
	print(panels[24].rect_position)
		
	if panels[4].rect_position == values[0] and panels[10].rect_position == values[1] and panels[24].rect_position == values[2]:
		#Answer 404
		print("completed")
		return true
