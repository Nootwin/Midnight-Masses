class_name Item extends Area2D

@export var isAxe : bool = false
@export var damagelow : int
@export var damagehigh : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture = $Sprite2D.texture
	$CollisionShape2D.shape.size.x = texture.get_width() * 4
	$CollisionShape2D.shape.size.y = texture.get_height() * 4
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	



func _on_body_entered(body: Node2D) -> void:
	if (body is Provider and $"../../..".swinging):
		body.on_hit(self)
