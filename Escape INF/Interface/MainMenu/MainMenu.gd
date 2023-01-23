extends Control

export (String, FILE, "*.tscn") var first_scene
export (String, FILE, "*.tscn") var tutorial_scene

func _ready():
	AudioPlayer.stop_all_audios()

func _on_PlayButton_pressed():
	var _a = get_tree().change_scene(first_scene)

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_TutorialButton_pressed():
	var _b = get_tree().change_scene(tutorial_scene)
