extends Area2D

export(Resource) var item_data

var selected := false

onready var sprite := $Sprite

signal collected

func _ready():
	sprite.texture = item_data.sprite

func _on_Collectable_mouse_entered():
	selected = true

func _on_Collectable_mouse_exited():
	selected = false

func _input(event):
	if event is InputEventMouseButton:
		if selected and event.button_index == BUTTON_LEFT:
			collect()
			queue_free()
			
func collect():
	print(item_data.name + " coletado!")
	emit_signal("collected", item_data)
