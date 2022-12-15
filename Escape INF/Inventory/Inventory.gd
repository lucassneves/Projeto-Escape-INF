extends Node

const DESELECT_INDEX = -10

const inventory_size := 12

var selected_item_index = DESELECT_INDEX

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
			
