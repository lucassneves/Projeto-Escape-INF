extends Control

export (String, FILE, "*.tscn") var first_scene
export (String, FILE, "*.tscn") var tutorial_scene

var SOUNDTRACK2 = preload("res://Audio/SFX/anime_soundtrack_inf.mp3")

func _ready():
	Blur.visible = false
	if AudioPlayer.music_playing == false:
		AudioPlayer.play_audio(SOUNDTRACK2, "Music")
		AudioPlayer.music_playing = true

	if not ProgressManager.game_started:
		$Buttons/PlayButton.text = "JOGAR"
	else:
		$Buttons/PlayButton.text = "CONTINUAR"

func _on_PlayButton_pressed():
	if not ProgressManager.game_started:
		SceneTransition.transition_scene(first_scene)
		ProgressManager.game_started = true
	else:
		SceneTransition.transition_scene("res://Rooms/Lab257/Lab257.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_TutorialButton_pressed():
	var _b = get_tree().change_scene(tutorial_scene)
