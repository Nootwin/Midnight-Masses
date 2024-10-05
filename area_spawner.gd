extends Node2D

var sc = 64


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var move = get_parent().maxsteps
	var atk = get_parent().range
	$Movement.polygon = _buildPoints(move)
	$Movement.offset = Vector2(move * -64 -32 ,-32)
	$AttackRange.polygon = _buildPoints(move+atk)
	$AttackRange.offset = Vector2((move+atk) * -64 - 32, -32)
	pass # Replace with function body.

	
func _buildPoints(point):
	var uppoint = (point-1) * sc
	var downpoint = -(point-1) * sc
	var xamo = sc
	var yamo = -sc
	var curx = 0
	var cury = 0
	var area : PackedVector2Array
	var isX = false
	
	area.append(Vector2(0, 0))
	curx += sc
	
	while true:
		area.append(Vector2(curx, cury))
		if isX:
			curx += xamo
			isX = false
			if (cury == 0):
				xamo = -xamo
		else:
			if (cury-sc > uppoint or cury < downpoint):
				yamo = -yamo
			cury += yamo
			isX = true

		if (curx == 0 and cury == 0):
			break
		print(curx, cury)
	return area
	
	
