extends Area2D
var _hovering = false

onready var readable = get_parent().get_node("ReadableArea") 

onready var area_collision = $CollisionShape2D

func _ready():
	
	if ProgressManager.check_progress("unlocked_items","res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "DicaFinal"):
		area_collision.disabled = true
		readable.visible = true
		ProgressManager.add_unlocked_item("res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall2", "Gaveta")

