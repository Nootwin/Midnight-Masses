extends Button



func _on_pressed() -> void:
	get_tree().change_scene_to_file($"/root/Node2D/BattleEssentials".next_scene)
