extends CanvasLayer

onready var colorRect = $ColorRect

func unfocus_blur():
	show()
	colorRect.material.set("shader_param/blur_amount", 2)
	colorRect.material.set("shader_param/mix_amount", 0.2)
	colorRect.material.set("shader_param/color_over", Color("000000"))
