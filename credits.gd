extends RichTextLabel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (position.y > -2500):
		position.y -= delta * 100
