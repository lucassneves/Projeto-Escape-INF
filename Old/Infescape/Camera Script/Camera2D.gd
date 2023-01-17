extends Camera2D

var zoomed = false
var normal_position = position

var mouse = get_global_mouse_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if zoomed == false and event.button_index == BUTTON_RIGHT:
			mouse = get_global_mouse_position()
			print(mouse)
			position = mouse
			zoomed = true
			zoom()
			zoom.x -= 0.25
			zoom.y -= 0.25
		elif zoomed and event.button_index == BUTTON_RIGHT:
			zoomed = false
			zoom.x += 0.25
			zoom.y += 0.25
			position = normal_position
			zoom_out()

func zoom():
	print("zoom!")

func zoom_out():
	print("zoom out!")


