extends AudioStreamPlayer


func _on_AudioStreamPlayer_finished():
	play(0)

func on_play():
	stream_paused = false

func on_pause():
	stream_paused = true
