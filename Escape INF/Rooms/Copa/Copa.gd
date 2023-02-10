extends Node2D

onready var monkey: Area2D = get_tree().get_current_scene().get_node("Walls/Copa_Wall1/Macaco")

func _ready():
	
	if ProgressManager.check_progress("unlocked_items", "res://Rooms/Copa/Copa.tscn", "Copa_Wall1", "Banana"):
		monkey.queue_free()
