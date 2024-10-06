extends Provider


func dispense(amount):
	if (!$"..".opened):
		$"..".opened = true
		$AudioStreamPlayer2D.play()
		$Sprite2D.texture.region.position.x = 16
		for child in $Contents.get_children():
			$"/root/Inventory".add_to_deck(child.duplicate(5))
			await get_tree().create_timer(0.3).timeout
		await get_tree().create_timer(1).timeout
		$"/root/Inventory".levelcomp[$"/root/Node2D".levelID] = true
		get_tree().change_scene_to_file("res://worldmap.tscn")
	
