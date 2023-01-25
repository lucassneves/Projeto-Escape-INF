extends Area2D

export(String) var nome

export(NodePath) var collectable_path

onready var label = get_tree().current_scene.get_node("UI Layer/UI/HoverInfoLabel")

func _ready():
	if collectable_path:
		var collectable = get_node(collectable_path)
		collectable.connect("tree_exited", self, "collectable_collected")

func _on_HoverInfo_mouse_entered():
	label.text = nome
	
func _on_HoverInfo_mouse_exited():
	if label.text == nome:
		label.text = ""

func collectable_collected():
		queue_free()
		label.text = ""
