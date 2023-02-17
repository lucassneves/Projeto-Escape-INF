extends Node

const inventory_size := 12

var selected_item_index = null setget set_selected_item_index

#export(Array, Resource) var items = [
#	preload("res://Items/Celular/celular.tres"),
#	preload("res://Items/CableEthernet/cable_ethernet.tres"),
#	preload("res://Items/ControleAr/ControleAr.tres"),
#	preload("res://Items/Chave251/chave251.tres"),
#	preload("res://Items/Chave257/chave257.tres"),
#	preload("res://Items/Banana/banana.tres"),
#	preload("res://Items/Ticket/inter_ticket.tres"),
#	preload("res://Items/NotebookAcer/notebook_acer.tres"),
#	null,
#	null,
#	null,
#	null
#]

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
			if selected_item_index == i:
				selected_item_index = null
			return
	print("Item nao encontrado")
			
func set_selected_item_index(index):
	selected_item_index = index
	emit_signal("selected_item_changed")

func get_selected_item():
	if selected_item_index != null:
		return items[selected_item_index]
