extends Provider


func dispense(amount):
	super.dispense(amount)
	$AudioStreamPlayer2D.play()
	$Sprite2D.texture.region.x = 16
	get_tree().paused = true
	for child in $Contents.get_children():
		$"/root/Inventory".add_to_deck(child.duplicate(5))
		await get_tree().create_timer(0.3).timeout
	await get_tree().create_timer(1).timeout
	get_tree().paused = false
	$"/root/Inventory".levelComp[$"/root/Node2D".levelID] = true
	get_tree().change_scene_to_file("res://worldmap.tscn")
	
