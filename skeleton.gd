extends BasicEnemy

var bonefile = preload("res://bone.tscn")

func _attack():
	var bone = bonefile.instantiate()
	bone.velocity = global_position.direction_to($"../Bplayer".global_position) * 50
	add_child(bone)
