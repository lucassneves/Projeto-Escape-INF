extends Node2D

onready var inventory := get_parent().get_node("CanvasLayer/UI/Inventory")
onready var textBox := get_parent().get_node("CanvasLayer/UI/TextBox")

func _ready():
	for child in get_children():
		child.connect("collected", inventory, "_on_Collectable_collected")
		child.connect("collected", textBox, "_on_Collectable_collected")
