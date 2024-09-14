extends TextureButton

@export var level : PackedScene




func _on_pressed():	
	$AudioStreamPlayer.play()
	
	pass # Replace with function body.


func _on_audio_stream_player_finished():
	get_tree().change_scene_to_packed(level)
	pass # Replace with function body.
