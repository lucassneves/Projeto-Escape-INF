extends Area2D

export(Resource) var item_data

onready var sprite := $Sprite

signal collected

func _on_Collectable_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		collect()

func collect():
	print(item_data.name + " coletado!")
	emit_signal("collected", item_data)
	TextBox.show_text("Você colocou " + item_data.name + " na sua mochila.")
	Inventory.add_item(item_data)
	ItemsCollected.add_collected_item(get_tree().get_current_scene().name, get_parent().get_parent().name, item_data)
	queue_free()
