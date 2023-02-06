extends Area2D

const BANANA = preload("res://Items/Banana/banana.tres")

var _hovering = false

onready var bananaCollectable = get_parent().get_node("Collectable")

func _on_Macaco_mouse_entered():
	_hovering = true

func _on_Macaco_mouse_exited():
	_hovering = false

func _input(event):
	if _hovering:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			get_tree().set_input_as_handled()
			if Inventory.get_selected_item() == BANANA:
				TextBox.show_texts(["Você entregou a banana para o macaco e ele foi embora, deixando o controle cair."])
				bananaCollectable.get_node("AnimationPlayer").play("Fall")
				Inventory.remove_item(BANANA)
				queue_free()
			else:
				TextBox.show_texts(["O macaco está segurando um controle de ar condicionado! Será que consigo pegar?"])
	

