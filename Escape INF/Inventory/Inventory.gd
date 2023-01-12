extends Node

const DESELECT_INDEX = -10

const inventory_size := 12

var selected_item_index = DESELECT_INDEX setget set_selected_item_index

export(Array, Resource) var items = [
	preload("res://Items/Celular/celular.tres"),
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null
]

signal item_changed(index)
signal selected_item_changed

func add_item(item: Item):
	for i in range(inventory_size):
		if items[i] == null:
			items[i] = item
			emit_signal("item_changed", i)
			return
	print("Mochila cheia!")

func remove_item(item: Item):
	for i in range(inventory_size):
		if items[i] == item:
			items[i] = null
			emit_signal("item_changed", i)
			return
	print("Item nao encontrado")
			
func set_selected_item_index(index):
	selected_item_index = index
	emit_signal("selected_item_changed")
