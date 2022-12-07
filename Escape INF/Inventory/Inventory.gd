extends Node

const inventory_size := 12

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
