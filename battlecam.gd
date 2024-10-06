extends Camera2D

var mouse_change : Vector2


func _physics_process(delta: float) -> void:
	if (get_parent().isturn):
		var mouse = get_local_mouse_position()
		if (mouse.x < -540):
			mouse_change.x -= 10
		elif (mouse.x > 540):
			mouse_change.x += 10
		if (mouse.y < -300):
			mouse_change.y -= 10
		elif (mouse.y > 300):
			mouse_change.y += 10
		print(mouse)
	position.x = move_toward(position.x, get_parent().global_position.x + mouse_change.x, 20)
	position.y = move_toward(position.y, get_parent().global_position.y + mouse_change.y, 20)
		
