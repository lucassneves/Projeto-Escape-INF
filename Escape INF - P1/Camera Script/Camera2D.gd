extends Camera2D

var position_camera_global
var zoomed = false
var normal_position = position
var total_anxiety := 0
var forca = 0
var even_more_anxiety := 0
const max_anxiety := 10000
var time = 0
onready var anxiety_bar := get_tree().get_root().find_node("Healthbar",true,false)
onready var light := get_tree().get_root().find_node("Light2D",true,false)

var mouse = get_global_mouse_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	position_camera_global = global_position
	pass # Replace with function body.

func _process(delta):
	global_position = position_camera_global + Vector2(forca,forca).rotated(time)
	forca = lerp(forca, 0, .1)
	time += delta*400
	total_anxiety -= 1
	if total_anxiety >= max_anxiety:
		print("PERDEU")
		get_tree().reload_current_scene()
		
	anxiety_bar._on_health_updated(total_anxiety)
	if total_anxiety < 0: 
		total_anxiety = 0
	if total_anxiety >= 8000 && total_anxiety < 9000 && (Input.is_mouse_button_pressed(BUTTON_LEFT)): #leve e movimento de vector melhor entre 0.2 e 0.5
		forca = 1
	
	#Ou pode seguir movimentando sem parar
#	if total_anxiety >= 150 && total_anxiety < 280:
#		forca = 0.5
#		time += delta*400
		
	elif total_anxiety >= 9000:
		forca = 0.5
		time += delta*1000
		pannic_attack()
		#light._light_on()
		
	
		
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		
		anxiety_bar._on_health_max(max_anxiety)
		anxiety_bar._on_health_updated(more_anxiety())

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
			

func more_anxiety():
	even_more_anxiety += 15
	total_anxiety += even_more_anxiety
	return total_anxiety
	
func zoom():
	print("zoom!")

func zoom_out():
	print("zoom out!")
	
func pannic_attack():
	print("panic attack!")



