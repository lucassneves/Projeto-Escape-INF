extends Area2D

export(bool) var locked := false

export(Resource) var item_needed

export(String, MULTILINE) var locked_prompt
export(String, MULTILINE) var item_used

onready var inventory := get_parent().get_node("CanvasLayer/UI/Inventory")
onready var textBox := get_parent().get_node("CanvasLayer/UI/TextBox")

func _on_Interactable_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		interact()

func interact():
	if locked:
		if inventory.items.has(item_needed):
			textBox.show_text(item_used)
			locked = false
		else:
			textBox.show_text(locked_prompt)
