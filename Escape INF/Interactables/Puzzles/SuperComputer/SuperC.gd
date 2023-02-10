extends Control

onready var computer = $Computer

#onready var computera: AnimatedSprite = get_tree().get_node("Walls/SalaNRC_Wall2/AnimatedSprite")

func _ready():
	computer.play("Typed")
	#computera.show()
	#computera.play("computer")


func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var _a = get_tree().change_scene(ProgressManager.previous_room)
