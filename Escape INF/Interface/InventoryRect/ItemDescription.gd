extends VBoxContainer

onready var item_name_label := $Label
onready var item_sprite_rect := $TextureRect
onready var item_description_label := $Label2

func update_selected_item(item: Item):
	item_name_label.text = item.name
	item_sprite_rect.texture = item.sprite
	item_description_label.text = item.description
