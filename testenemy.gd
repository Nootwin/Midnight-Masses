extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var path = $NavigationAgent2D.get_next_path_position()
	print(path)
	if (path):
		var dir = global_position.direction_to(path)
		velocity = Vector2(2000 * delta, 2000 * delta) * dir
		move_and_slide()
	pass
	
func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.is_pressed()):
		print("here")
		$NavigationAgent2D.target_position = get_global_mouse_position()
