extends CanvasLayer

func transition_scene(next_scene: String):
	SceneTransition.get_node("AnimationPlayer").play("In")
	yield(SceneTransition.get_node("AnimationPlayer"), "animation_finished")
	
	var _a = get_tree().change_scene(next_scene)
	SceneTransition.get_node("AnimationPlayer").play("Out")
	
	yield(SceneTransition.get_node("AnimationPlayer"), "animation_finished")
	
