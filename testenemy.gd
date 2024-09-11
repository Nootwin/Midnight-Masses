extends CharacterBody2D

@onready var tilemap = $"../TileMapLayer"
var astar = AStarGrid2D.new()
var target_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	astar.region = tilemap.get_used_rect()
	astar.cell_size = tilemap.tile_set.tile_size * Vector2i(tilemap.scale)
	astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar.update()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var start = tilemap.local_to_map(tilemap.to_local(global_position))
	var end = tilemap.local_to_map(tilemap.to_local(target_position))
	var path = astar.get_point_path(start, end)
	path.remove_at(0)
	if (not path.is_empty()):
		var dir = Vector2(start) - path[0]
		print(dir)
		velocity = Vector2(-1, -1) * dir
		move_and_collide(velocity)
	pass
	
func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.is_pressed()):
		target_position = get_global_mouse_position()
