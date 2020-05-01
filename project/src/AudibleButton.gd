extends Button
class_name AudibleButton

signal audio_feedback_complete


func _on_Button_pressed():
	$AudioStreamPlayer.play()


func _on_AudioStreamPlayer_finished():
	emit_signal("audio_feedback_complete")
