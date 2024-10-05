extends CharacterBody2D
@onready var wantedpos : Vector2 = global_position
@onready var lastpos : Vector2 = global_position
@onready var size = 16 * $Sprite2D.scale.x
@onready var tilemap = $"../Layer0"
@onready var sun = $"../CanvasLayer/OnScui/TextureRect/TextureRect"
var lastdir : Vector2 = Vector2(-2, -2)
const SPEED = 8.0
var swinging : bool = false
var posinMap : Vector2i
var spdir : String = "up"
var moving : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rect = tilemap.get_used_rect().size * 32
	$Camera2D.limit_top = -rect.y
	$Camera2D.limit_bottom = rect.y
	$Camera2D.limit_left = -rect.x
	$Camera2D.limit_right = rect.x
	
	posinMap = global_position / 64
	moving = false
	
	$"/root/Inventory".newday($"/root/Node2D")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if (swinging):
		$Arm/Hand.rotation_degrees -= 6
		if ($Arm/Hand.rotation_degrees < -270):
			swinging = false
			
	elif (Input.is_mouse_button_pressed(1)):
		
		$Arm/Hand.rotation_degrees = -90
		swinging = true
	else:
		$Arm/Hand.rotation_degrees = 180
			
	if (not moving):
		var dir = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
		var newdir : Vector2
		if (dir == Vector2(0, 0)):
			newdir = Vector2(-2, -2)
			$Sprite2D.play(spdir + "_idle")
		else:
			if (sun != null):
				sun.increase(0.5)
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
			$Arm.rotation =  newdir.angle() - PI/2
			posinMap += Vector2i(newdir)
			
			if (newdir.y == -1):
				spdir = "up"
			elif (newdir.y == 1):
				spdir = "down"
			elif (newdir.x == -1):
				$Sprite2D.flip_h = false
			elif (newdir.x == 1):
				$Sprite2D.flip_h = true
			$Sprite2D.play(spdir + "_walk")
			moving = true
	else:
		if (lastdir.x != 0 and lastdir.x != -2 ):
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
		if (wantedpos == global_position):
				moving = false






















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
