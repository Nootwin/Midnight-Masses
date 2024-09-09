extends CharacterBody2D
@onready var wantedpos : Vector2 = global_position
@onready var lastpos : Vector2 = global_position
@onready var size = 16 * $Sprite2D.scale.x
var lastdir : Vector2 = Vector2(-2, -2)
const SPEED = 8.0
var swinging : bool = false
var posinMap : Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	posinMap = global_position / 64
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	$Arm.rotation = $Arm.global_position.angle_to(get_global_mouse_position())
	if (swinging):
		$Hand.rotation_degrees -= 6
		if ($Hand.rotation_degrees < -180):
			swinging = false
			
	elif (Input.is_mouse_button_pressed(1)):
		$Hand.rotation_degrees = -90
		swinging = true
	else:
		$Hand.rotation = 0
			
	if (global_position == wantedpos):
		var dir = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
		var newdir : Vector2
		if (dir == Vector2(0, 0)):
			newdir = Vector2(-2, -2)
		else:
			if (dir == lastdir):
				newdir = lastdir
			else:
				if (dir.x != 0 and dir.x == lastdir.x):
					newdir = Vector2(0, dir.y)
				elif (dir.y != 0 and dir.y == lastdir.y):
					newdir = Vector2(dir.x, 0)
				elif (dir.y == 1):
					newdir = Vector2(0, 1)
				elif (dir.y == -1):
					newdir = Vector2(0, -1)
				elif (dir.x == 1):
					newdir = Vector2(1, 0)
				elif (dir.x == -1):
					newdir = Vector2(-1, 0)
				else:
					newdir = Vector2(-2, -2)
				lastdir = newdir
			wantedpos = global_position + (size * newdir)
			lastpos = global_position
			rotation = newdir.angle() - PI/2
			posinMap += Vector2i(newdir)
			
		
	elif (lastdir.x != 0 and lastdir.x != -2 ):
		velocity.y = 0
		velocity.x = move_toward(global_position.x, wantedpos.x, SPEED) - global_position.x
		var col = move_and_collide(velocity)
		if (col):
			wantedpos = lastpos
	elif (lastdir.y != 0 and lastdir.y != -2 ):
		velocity.x = 0
		velocity.y = move_toward(global_position.y, wantedpos.y, SPEED) -  global_position.y
		var col = move_and_collide(velocity)
		if (col):
			wantedpos = lastpos






















#if ((dir.x != lastdir.x and dir.y == lastdir.y) or dir.x == 0):
			#if ((dir.y != lastdir.y and dir.x == lastdir.x) or dir.y == 0):
				#if (dir.y == 1):
					#newdir = Vector2(0, 1)
				#elif (dir.y == -1):
					#newdir = Vector2(0, -1)
				#elif (dir.x == 1):
					#newdir = Vector2(1, 0)
				#elif (dir.x == -1):
					#newdir = Vector2(-1, 0)
				#
				#else:
					#newdir = Vector2(-2, -2)
					#
			#else:
				#newdir = Vector2(0, dir.y)
		#else:		
			#newdir = Vector2(dir.x, 0)
	#elif (lastdir.x != 0):
		#global_position.x = move_toward(global_position.x, wantedpos.x, SPEED)
	#elif (lastdir.y != 0):
		#global_position.y = move_toward(global_position.y, wantedpos.y, SPEED)
