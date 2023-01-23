extends Node

func play_audio(audio, bus: String):
	var audioStreamPlayer = AudioStreamPlayer.new()
	audioStreamPlayer.stream = audio
	audioStreamPlayer.bus = bus
	audioStreamPlayer.connect("finished", self, "on_audio_finished", [audioStreamPlayer])
	add_child(audioStreamPlayer)
	audioStreamPlayer.play()
	
func on_audio_finished(audioStreamPlayer):
	audioStreamPlayer.queue_free()

func stop_all_audios():
	for audioPlayer in get_children():
		audioPlayer.queue_free()
