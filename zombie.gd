extends BasicEnemy

func _attack():
	$Sprite2D.play("Attack")
	_do_when_hit()
