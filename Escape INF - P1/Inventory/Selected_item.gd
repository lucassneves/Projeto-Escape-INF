extends VBoxContainer

onready var item_name_label := $Label
onready var item_sprite_rect := $TextureRect
onready var inventory := get_tree().get_root().find_node("Inventory",true,false)

func _ready():
	item_name_label.text = inventory.return_item().name
	item_sprite_rect.texture = inventory.return_item().sprite

func _process(delta):
	item_name_label.text = inventory.return_item().name
	item_sprite_rect.texture = inventory.return_item().sprite	
