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
				
				if index == 6:
					var switcher
					first_panel = index
					switcher = panels[0].rect_position
					panels[0].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = switcher
					first_panel = null
					switcher = null
				
				elif index == 13:
					var switcher
					first_panel = index
					switcher = panels[7].rect_position
					panels[7].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = switcher
					first_panel = null
					switcher = null
					
				elif index == 20:
					var switcher
					first_panel = index
					switcher = panels[14].rect_position
					panels[14].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = switcher
					first_panel = null
					switcher = null	
				
				elif index == 27:
					var switcher
					first_panel = index
					switcher = panels[21].rect_position
					panels[21].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = switcher
					first_panel = null
					switcher = null	
				
				elif first_panel==null:
					var switcher
					first_panel = index
					#print(first_panel)
					switcher = panels[index+1].rect_position
					panels[index+1].rect_position = panels[first_panel].rect_position
					panels[first_panel].rect_position = switcher
					first_panel = null
					switcher = null

						
				
				
				if check_completion() == true:
					get_parent().complete()
					completed = true


func check_completion():
	var values = [Vector2(16,21), Vector2(59,21), Vector2(16,63), Vector2(59,63)] 
	
	#print(panels[0].rect_position)
	#print(panels[8].rect_position)
	#print(panels[18].rect_position)
	#print(panels[27].rect_position)


		
	if panels[0].rect_position == values[0] and panels[8].rect_position == values[1] and panels[18].rect_position == values[2] and panels[27].rect_position == values[3]:
		#Answer 404
		#print("completed")
		return true
