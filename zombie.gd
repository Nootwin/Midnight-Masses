extends CharacterBody2D

@onready var tilemap = $"../../TileMapLayer"

var target_position : Vector2 = Vector2(32, -32)
var isturn = false
var path
var wantedpos : Vector2
var dirani = "up"
@export var maxsteps : int
@export var dmg : int
var steps : int
@export var range : int
@export var health : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wantedpos = global_position
	steps = maxsteps
	
	pass # Replace with function body.

func damage(amount : int):
	health -= amount
	if (health < 1):
		die()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_turn():
	await get_tree().create_timer(0.5).timeout
	target_position = $"../Bplayer".global_position
	var start = tilemap.local_to_map(tilemap.to_local(global_position))
	var end = tilemap.local_to_map(tilemap.to_local(target_position))
	path = get_parent().astar.get_point_path(start, end)
	path.remove_at(0)
	steps = maxsteps
	isturn = true
	get_parent().astar.set_point_solid(start, false)
	
func _physics_process(delta: float) -> void:
	if (isturn):
			
		if (wantedpos == global_position):
			steps -= 1
			if (path.size() <= range):
				$AudioStreamPlayer2D.play()
				$"/root/Inventory".damage(dmg)
				get_parent().astar.set_point_solid(tilemap.local_to_map(tilemap.to_local(global_position)), true)
				get_parent().next()
			elif (not path.is_empty()):
				if (path[0].x == global_position.x):
					if (path[0].y > global_position.y):
						wantedpos = Vector2(0, 64) + global_position
						velocity = Vector2(0, 8)
						dirani = "down"
					else:
						wantedpos = Vector2(0, -64) + global_position
						velocity = Vector2(0, -8)
						dirani = "up"
				else:
					
					if (path[0].x > global_position.x):
						wantedpos = Vector2(64, 0) + global_position
						velocity = Vector2(8, 0)
						$Sprite2D.flip_h = true
					else:
						wantedpos = Vector2(-64, 0) + global_position
						velocity = Vector2(-8, 0)
						$Sprite2D.flip_h = false
				path.remove_at(0)
				$Sprite2D.play(dirani + "_walk")
				if (steps > -1):
					move_and_collide(velocity)
			else:
				$Sprite2D.play(dirani + "_idle")
			if (steps < 0 and isturn):
				get_parent().astar.set_point_solid(tilemap.local_to_map(tilemap.to_local(global_position)), true)
				get_parent().next()
				wantedpos = global_position
			
		elif (wantedpos.x != global_position.x):
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


func _on_mouse_exited() -> void:
	pass # Replace with function body.
