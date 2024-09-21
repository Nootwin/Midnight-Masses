extends Node2D

@export var up : Path2D
@export var upstart : int
@export var down : Path2D
@export var downstart : int
@export var forward : Path2D
@export var back : Path2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func move(dir : String):
	if (dir == "up"):
		if (up != null):
			get_node("PathFollow2D").jump_to(up, upstart)
	elif (dir == "down"):
		if (down != null):
			get_node("PathFollow2D").jump_to(down, downstart)
	elif (dir == "forward"):
		if (forward != null):
			get_node("PathFollow2D").jump_to(forward, 0)
	else:
		if (back != null):
			get_node("PathFollow2D").jump_to(back, 100)
