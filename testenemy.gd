extends CharacterBody2D

@onready var tilemap = $"../../TileMapLayer"
var astar = AStarGrid2D.new()
var target_position : Vector2 = Vector2(32, -32)
var isturn = false
var path
@export var maxsteps : int
var steps : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	astar.region = tilemap.get_used_rect()
	astar.cell_size = tilemap.tile_set.tile_size * Vector2i(tilemap.scale)
	astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar.offset = Vector2(32, 32)
	astar.update()
	steps = maxsteps
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_turn():
	target_position = $"../Bplayer".global_position
	var start = tilemap.local_to_map(tilemap.to_local(global_position))
	var end = tilemap.local_to_map(tilemap.to_local(target_position))
	path = astar.get_point_path(start, end)
	path.remove_at(0)
	steps = maxsteps
	
func _physics_process(delta: float) -> void:
	if (isturn):
		steps -= 1
		if (not path.is_empty()):
			
			if (path[0].x == global_position.x):
				if (path[0].y > global_position.y):
					velocity = Vector2(0, 64)
				else:
					velocity = Vector2(0, -64)
			else:
				if (path[0].x > global_position.x):
					velocity = Vector2(64, 0)
				else:
					velocity = Vector2(-64, 0)
			move_and_collide(velocity)
			path.remove_at(0)
		if (steps < 1):
			get_parent().next()
