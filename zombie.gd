extends CharacterBody2D

@onready var tilemap = $"../../TileMapLayer"
var astar = AStarGrid2D.new()
var target_position : Vector2 = Vector2(32, -32)
var isturn = false
var path
var wantedpos : Vector2
var dirani = "up"
@export var maxsteps : int
var steps : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wantedpos = global_position
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
	print(path)
	steps = maxsteps
	
func _physics_process(delta: float) -> void:
	if (isturn):
		if (wantedpos == global_position):
			steps -= 1
			if (not path.is_empty()):
				if (path[0].x == global_position.x):
					if (path[0].y > global_position.y):
						wantedpos = Vector2(0, 64) + global_position
						velocity = Vector2(0, 16)
						dirani = "down"
					else:
						print(path[0] - global_position, path[0], global_position)
						wantedpos = Vector2(0, -64) + global_position
						velocity = Vector2(0, -16)
						dirani = "up"
				else:
					
					if (path[0].x > global_position.x):
						wantedpos = Vector2(64, 0) + global_position
						velocity = Vector2(16, 0)
						$Sprite2D.flip_h = true
					else:
						wantedpos = Vector2(-64, 0) + global_position
						velocity = Vector2(-16, 0)
						$Sprite2D.flip_h = false
				path.remove_at(0)
				$Sprite2D.play(dirani + "_walk")
				if (steps > 0):
					move_and_collide(velocity)
			else:
				$Sprite2D.play(dirani + "_idle")
			if (steps < 0):
				get_parent().next()
			
		elif (wantedpos.x != global_position.x):
			print(global_positiona)
			velocity.y = 0
			velocity.x = move_toward(global_position.x, wantedpos.x, 16) - global_position.x
			move_and_collide(velocity)
		elif (wantedpos.y != global_position.y):
			velocity.x = 0
			velocity.y = move_toward(global_position.y, wantedpos.y, 16) - global_position.y
			move_and_collide(velocity)

func die():
	get_parent().turnOrder.erase(self)
	queue_free()
