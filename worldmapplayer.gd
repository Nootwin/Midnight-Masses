extends PathFollow2D
var speed : float
var destination : Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
	
	
func jump_to(path : Path2D, spot : float):
	get_parent().remove_child(self)
	progress_ratio = spot
	path.add_child(self)
	if (spot > 50):
		destination = path.start_destination
		speed = -1
	else:
		destination = path.end_destination
		speed = 1
	
	
	
