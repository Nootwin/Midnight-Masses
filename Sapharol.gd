extends BasicEnemy

var zombiefile = preload("res://zombie.tscn")

func pass_after_one(time : int = 1):
	var xoff : int
	var yoff : int
	var pos : Vector2
	var tilepos = tilemap.local_to_map(tilemap.to_local(global_position))
	isturn = false
	while true:
		xoff = randi_range(-2, 2)
		yoff = randi_range(-2, 2)
		pos = tilepos + Vector2i(xoff, yoff)
		
		if !get_parent().astar.is_point_solid(pos):
			var zombie : BasicEnemy = zombiefile.instantiate()
			zombie.dmg = 2
			zombie.health = 3
			zombie.maxsteps = 4
			zombie.range = 1
			get_parent().add_child(zombie)
			get_parent().turnOrder.push_back(zombie)
			zombie.global_position = pos * 64 + Vector2(32, 32)
			zombie.wantedpos = zombie.global_position
			get_parent().astar.call_deferred("set_point_solid", tilemap.local_to_map(tilemap.to_local(zombie.global_position)), true)
			break;
		
	await get_tree().create_timer(time).timeout
	get_parent().next()	
