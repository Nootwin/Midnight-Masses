class_name FakeCard extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	modulate.a -= 0.04
	position.y += 1
	if (modulate.a < 0):
		queue_free()
