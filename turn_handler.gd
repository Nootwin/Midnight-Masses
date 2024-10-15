extends Node2D
@onready var turnOrder = get_children()
var astar = AStarGrid2D.new()
@onready var tilemap = $"../TileMapLayer"
@onready var cam = $Bplayer/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	astar.region = tilemap.get_used_rect()
	astar.cell_size = tilemap.tile_set.tile_size * Vector2i(tilemap.scale)
	astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar.offset = Vector2(32, 32)
	astar.update()
	var env = $"/root/Inventory".enviroment
	env.tree_entered.connect(_on_env_entered)
	get_parent().add_child.call_deferred(env)
	
	next()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func check_if_done():
	if (get_child_count() < 3):
		$"/root/Node2D/BattleEssentials"._completeLevel()	
	
func next():
	if (get_child_count() < 2):
		$"/root/Node2D/BattleEssentials"._completeLevel()
		
	else:
		turnOrder.back().isturn = false
		var nex = turnOrder.pop_front()
	

		turnOrder.push_back(nex)
		nex.start_turn()
		print(nex.name)
		cam.reparent(nex, false)
		cam.mouse_change = Vector2(0, 0)
	
func _on_env_entered():
	var env = $"/root/Inventory".enviroment
	var size
	for child in env.get_children():
		size = child.get_node("CollisionShape2D").shape.size.x / 2
		if (size > 8):
			astar.set_point_solid(tilemap.local_to_map(tilemap.to_local(child.global_position + Vector2(size, size))))
			astar.set_point_solid(tilemap.local_to_map(tilemap.to_local(child.global_position + Vector2(-size, size))))
			astar.set_point_solid(tilemap.local_to_map(tilemap.to_local(child.global_position + Vector2(size, -size))))
			astar.set_point_solid(tilemap.local_to_map(tilemap.to_local(child.global_position + Vector2(-size, -size))))
		else:
			astar.set_point_solid(tilemap.local_to_map(tilemap.to_local(child.global_position)))
