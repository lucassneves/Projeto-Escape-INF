extends Control

const inventory_size := 12

export(Array, Resource) var items = [
	null, null, null, null, null, null, null, null, null, null, null, null
]

var hovering_slot_index := 0
var selected_slot_index := 0

onready var slotsGrid := $GridContainer
onready var selectedRect := $TextureRect
onready var itemDescription := $ItemDescription

func _ready():
	for i in range(inventory_size):
		var _a = slotsGrid.get_child(i).connect("gui_input", self, "slot_gui_input", [i])
		update_slot(i)
	if items[selected_slot_index] != null:
		select_slot(selected_slot_index)
	
func slot_gui_input(event, slot_index):
	if event is InputEventMouseMotion:
		hovering_slot_index = slot_index

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			selected_slot_index = hovering_slot_index
			var item: Item = items[selected_slot_index]
			if item != null:
				select_slot(selected_slot_index)

func select_slot(slot_index):
	selectedRect.rect_position = slotsGrid.get_child(slot_index).rect_position
	itemDescription.update_selected_item(items[slot_index])
	
func update_slot(slot_index):
	var item: Item = items[slot_index]
	if item != null:
		var item_rect = TextureRect.new()
		item_rect.expand = true
		item_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		item_rect.texture = items[slot_index].sprite
		item_rect.rect_min_size = Vector2(70,70)
		slotsGrid.get_child(slot_index).add_child(item_rect)
		
	elif slotsGrid.get_child(slot_index).get_children().size() > 0:
		slotsGrid.get_child(slot_index).get_child(0).queue_free()

func _on_Button_pressed():
	hide()

func _on_Collectable_collected(item: Item):
	for i in range(inventory_size):
		if items[i] == null:
			items[i] = item
			update_slot(i)
			return
	print("Mochila cheia!")
