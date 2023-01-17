extends Control

export (String, FILE, "*.tscn") var left_scene_path = null
export (String, FILE, "*.tscn") var right_scene_path = null

onready var left_side := $LeftSide
onready var right_side := $RighSide

func _ready():
	if left_scene_path == null:
		left_side.hide()
		
	if right_scene_path == null:
		right_side.hide()

func _on_ClickableLeft_clicked():
	var _a = get_tree().change_scene(left_scene_path)

func _on_ClickableRight_clicked():
	var _a = get_tree().change_scene(right_scene_path)
