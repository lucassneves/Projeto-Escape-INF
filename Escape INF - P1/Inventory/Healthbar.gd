extends Control

onready var healthBar = $TextureProgress


func _on_health_updated(health): 
	healthBar.value = health
	
	
func _on_health_max(max_health):
	healthBar.max_value = max_health
	
