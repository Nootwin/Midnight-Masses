extends Node2D

var completed : bool = false
@export var up : Path2D
@export var upstart : int
@export var down : Path2D
@export var downstart : int
@export var forward : Path2D
@export var back : Path2D
@export var level : PackedScene
@export var card1 : Texture2D
@export var card2 : Texture2D
@export var card3 : Texture2D
@export var stringname : String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var coords = $"../../TileMapLayer2".local_to_map($"../../TileMapLayer2".to_local(self.global_position))
	completed = $"/root/Inventory".levelcomp[int(str(name))]
	if (completed):
		$"../../TileMapLayer2".set_cell(coords, 0, Vector2i($"../../TileMapLayer2".get_cell_atlas_coords(coords) + Vector2i(-1, 0)))
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func move(dir : String):
	if (dir == "up" and (completed == true or upstart == 1)):
		if (up != null):
			get_node("PathFollow2D").jump_to(up, upstart)
	elif (dir == "down" and (completed == true or downstart == 1)):
		if (down != null):
			get_node("PathFollow2D").jump_to(down, downstart)
	elif (dir == "forward" and completed):
		if (forward != null):
			get_node("PathFollow2D").jump_to(forward, 0)
	else:
		if (back != null):
			get_node("PathFollow2D").jump_to(back, 1)
