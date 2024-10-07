extends BasicEnemy

func _attack():
	$Sprite2D.play("Attack")
	_do_when_hit()
	
func _summon_animation():
	$AnimatedSprite2D.visible = true
	$Sprite2D.visible = false
	$AnimatedSprite2D.play("default")


func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.frame == 2:
		$Sprite2D.visible = true


func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.visible = false
