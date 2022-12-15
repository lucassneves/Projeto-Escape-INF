extends VBoxContainer

onready var item_name_label := $Label
onready var item_sprite_rect := $TextureRect
onready var item_description_label := $Label2

func update_selected_item(item: Item):
	if item == null:
		item_name_label.hide()
		item_sprite_rect.hide()
		item_description_label.hide()
	else:
		item_name_label.show()
		item_sprite_rect.show()
		item_description_label.show()
		item_name_label.text = item.name
		item_sprite_rect.texture = item.sprite
		item_description_label.text = item.description
