extends Node2D

func _process(delta):
	if ProgressManager.check_progress("unlocked_item", "res://Rooms/SalaNRC/Walls/SalaNRC.tscn", "SalaNRC_Wall3"):
		$Background.frame = 1

