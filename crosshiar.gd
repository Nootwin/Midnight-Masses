extends Node2D

@onready var grid = get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func draw_grid(array : Array[bool]):
	for i in grid.size():
		grid[i].visible = array[i]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
