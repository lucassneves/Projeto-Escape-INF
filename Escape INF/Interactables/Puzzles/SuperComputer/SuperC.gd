extends Control

onready var computer = $Computer

func _ready():
	computer.play("Typed")
