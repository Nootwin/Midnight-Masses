class_name BPlayer extends CharacterBody2D

@onready var wantedpos : Vector2 = global_position
@onready var lastpos : Vector2 = global_position
@onready var size = 16 * $Sprite2D.scale.x
var lastdir : Vector2 = Vector2(-2, -2)
const SPEED = 8.0
var swinging : bool = false
var posinMap : Vector2i
var spdir : String = "up"
var steps : int
var isturn = false
var health = 5
var ap
@onready var cardhandler = $"../../CanvasLayer/CardHandler"
@export var maxsteps : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rect = $"../../TileMapLayer".get_used_rect().size * 32
	$Camera2D.limit_top = -rect.y
	$Camera2D.limit_bottom = rect.y
	$Camera2D.limit_left = -rect.x
	$Camera2D.limit_right = rect.x
	
	steps = maxsteps
	posinMap = global_position / 64
	pass # Replace with function body.

func damage(amount : int):
	health -= amount
	if (health < 0):
		die()
	
func die():
	get_tree().change_scene_to_file("res://endscreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:	
	if (global_position == wantedpos and isturn and steps > 0):
		
		var dir = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
		var newdir : Vector2
		if (dir == Vector2(0, 0)):
			newdir = Vector2(-2, -2)
			$Sprite2D.play(spdir + "_idle")
		else:
			steps -= 1
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
			
	if (steps < 1):
			$Sprite2D.play(spdir + "_idle")
		
			
func start_turn():
	ap = 3
	steps = maxsteps
	cardhandler.draw_cards()
	isturn = true
	pass
	
