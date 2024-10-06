extends Area2D

var velocity : Vector2

func _physics_process(delta: float) -> void:
	rotation += 0.1
	position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if (body is BPlayer):
		get_parent()._do_when_hit()
		queue_free()
