extends Area2D

export(Resource) var item_data

onready var sprite := $Sprite

signal collected

func _ready():
	sprite.texture = item_data.sprite

func _on_Collectable_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		collect()

func collect():
	print(item_data.name + " coletado!")
	emit_signal("collected", item_data)
	queue_free()
