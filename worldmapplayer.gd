extends PathFollow2D
var speed : float
var destination : Node2D
@onready var ui = $"/root/Node2D/CanvasLayer/Control"
@onready var light = $PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("../" + str($"/root/Inventory".lastBeatDay))
	reparent(get_node("../" + str($"/root/Inventory".lastBeatDay)))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (get_parent() is Path2D):
		$Sprite2D.play("run")
		progress += speed
		if (progress_ratio <= 0 || progress_ratio >= 1):
			speed = 0
			get_parent().remove_child(self)
			destination.add_child(self)
			destination = null
			position = Vector2(0, 0)
			
	else:
		$Sprite2D.play("default")
	pass
	
func _input(event: InputEvent) -> void:
	if (event is InputEventKey && event.is_pressed() && !get_parent() is Path2D):
		if (event.keycode == KEY_W):
			get_parent().move("up")
		elif (event.keycode == KEY_S):
			get_parent().move("down")
		elif (event.keycode == KEY_D):
			get_parent().move("forward")
		elif (event.keycode == KEY_A):
			get_parent().move("back")
		elif (event.keycode == KEY_SPACE):
			light.start(get_parent().level)
	
func jump_to(path : Path2D, spot : float):
	get_parent().remove_child(self)
	path.add_child(self)
	progress_ratio = spot
	position = Vector2(0, 0)
	if (spot > 0.5):
		$Sprite2D.flip_h = false
		destination = path.start_destination
		speed = -5
	else:
		$Sprite2D.flip_h = true
		destination = path.end_destination
		speed = 5
	ui.load(destination)
	
	
	
