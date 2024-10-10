extends BasicEnemy

func _attack():
	$Sprite2D.play("Attack")
	_do_when_hit()
	
func _summon_animation():
	$AnimatedSprite2D.visible = true
	$Sprite2D.visible = false
	$AnimatedSprite2D.play("default")
