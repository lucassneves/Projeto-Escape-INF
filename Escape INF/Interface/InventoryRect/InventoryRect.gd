extends Control

const DESELECT_INDEX = -10

var hovering_slot_index := -1
var selected_slot_index := DESELECT_INDEX setget select_slot

onready var slotsGrid := $HBoxContainer/GridContainer
onready var selectedRect := $TextureRect
onready var itemDescription := $HBoxContainer/ItemDescription

signal selected_item_changed

func _ready():
	
	var _a = Inventory.connect("item_changed", self, "update_slot")
	
	for i in range(Inventory.inventory_size):
		var _b = slotsGrid.get_child(i).connect("gui_input", self, "slot_gui_input", [i])
		var _c = slotsGrid.get_child(i).connect("mouse_exited", self, "slot_mouse_exited")
		update_slot(i)

	self.selected_slot_index = Inventory.selected_item_index
	
func slot_gui_input(event, slot_index):
	if event is InputEventMouseMotion:
		hovering_slot_index = slot_index
		
func slot_mouse_exited():
	hovering_slot_index = -1 # null

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and hovering_slot_index != -1:
			var item: Item = Inventory.items[hovering_slot_index]
			if item != null:
				if hovering_slot_index == selected_slot_index:
					self.selected_slot_index = DESELECT_INDEX # Deselect
				else:
					self.selected_slot_index = hovering_slot_index # Select
				

func select_slot(slot_index):
	
	selected_slot_index = slot_index
	Inventory.selected_item_index = selected_slot_index
	emit_signal("selected_item_changed")
	
	if selected_slot_index == DESELECT_INDEX:
		selectedRect.hide()
		itemDescription.update_selected_item(null)
	else:
		selectedRect.show()
		selectedRect.rect_position = slotsGrid.get_child(slot_index).rect_position
		itemDescription.update_selected_item(Inventory.items[slot_index])
	
func update_slot(slot_index):
	var item: Item = Inventory.items[slot_index]
	if item != null:
		var item_rect = TextureRect.new()
		item_rect.expand = true
		item_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		item_rect.texture = Inventory.items[slot_index].sprite
		item_rect.rect_min_size = Vector2(32,32)
		slotsGrid.get_child(slot_index).add_child(item_rect)
		
	elif slotsGrid.get_child(slot_index).get_children().size() > 0:
		slotsGrid.get_child(slot_index).get_child(0).queue_free()
		self.selected_slot_index = DESELECT_INDEX

func _on_Button_pressed():
	get_parent().hide()

func _on_InventoryRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			get_parent().show()
			
