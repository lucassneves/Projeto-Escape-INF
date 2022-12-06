extends Node2D

onready var collectables = get_children()

func _input(event):
	if event is InputEvent and Input.is_action_just_pressed("ui_cancel"):
		var _a = get_tree().reload_current_scene()

# Previne que os itens que ja foram coletados apareçam novamente

func _ready():
	if not collectables.empty():
		var room_name = get_tree().get_current_scene().name
		var wall_name = get_parent().name
		if ItemsCollected.collected_items.has(room_name):
			if ItemsCollected.collected_items[room_name].has(wall_name):
				for item in ItemsCollected.collected_items[room_name][wall_name]:
					for collectable in collectables:
						if collectable.item_data == item:
							collectable.hide()

