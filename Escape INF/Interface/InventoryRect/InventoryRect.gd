extends Control

const ITEM_PANEL = preload("res://Interface/InventoryRect/itemPanel.tres")
const SELECTED_ITEM_PANEL = preload("res://Interface/InventoryRect/selectedItemPanel.tres")

var hovering_slot_index = null
var selected_slot_index = null setget select_slot

var _hovering = false

onready var slotsGrid := $HBoxContainer/GridContainer
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
	hovering_slot_index = null

func _input(event):
	if event is InputEventMouseButton:
		
		if event.button_index == BUTTON_LEFT and event.pressed and hovering_slot_index != null:
			var item: Item = Inventory.items[hovering_slot_index]
			if item != null:
				if hovering_slot_index == selected_slot_index:
					self.selected_slot_index = null # Deselect
				else:
					self.selected_slot_index = hovering_slot_index # Select
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and get_parent().visible and not _hovering:
		get_parent().visible = false
		get_tree().set_input_as_handled()
		Blur.visible = false

func select_slot(slot_index):
	
	var old_selected_slot_index = selected_slot_index
	selected_slot_index = slot_index
	Inventory.selected_item_index = selected_slot_index
	emit_signal("selected_item_changed")
	
	if old_selected_slot_index != null:
		slotsGrid.get_child(old_selected_slot_index).set("custom_styles/panel", ITEM_PANEL)
	
	if selected_slot_index == null:
		itemDescription.update_selected_item(null)
	else:
		slotsGrid.get_child(selected_slot_index).set("custom_styles/panel", SELECTED_ITEM_PANEL)
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
		self.selected_slot_index = null

func _on_InventoryRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			get_parent().show()
			Blur.unfocus_blur()

func _on_InventoryRect_mouse_entered():
	_hovering = true

func _on_InventoryRect_mouse_exited():
	_hovering = false
