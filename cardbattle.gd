class_name CardBattle extends Sprite2D
var dragging = false
var ofset : Vector2
@onready var crosshiar = $"/root/Node2D/TurnHandler/Bplayer/Boxes"
@onready var ui = $"../../BattleUI"
@onready var halfdim = get_viewport_rect().size / 2

@export var dmglow : int
@export var dmghigh : int
@export var range : int
@export var dura : int
@export var pattern : Array[bool]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if (dragging):
		global_position = get_global_mouse_position() - ofset
		var dis = global_position - halfdim
		if (abs(dis.x) > abs(dis.y)):
			if (dis.x < 0):
				crosshiar.rotation_degrees = 270
			else:
				crosshiar.rotation_degrees = 90
		else:
			if (dis.y < 0):
				crosshiar.rotation_degrees = 0
			else:
				crosshiar.rotation_degrees = 180
				
		var wantedposx = int(dis.x) / 64
		var wantedposy = int(dis.y) / 64
		print(wantedposx, wantedposy)
		
		if (wantedposx > range-1):
			wantedposx = range-1
		elif (wantedposx < -range+1):
			wantedposx = -(range-1)
		if (wantedposy > range-1):
			wantedposy = range-1
		elif (wantedposy < -range+1): 
			wantedposy = -(range-1)
			
		crosshiar.global_position = Vector2(wantedposx * 64 - 32, wantedposy * 64 - 32)
func _on_button_button_down() -> void:
	ofset = get_global_mouse_position() - global_position
	modulate.a = 0.5
	dragging = true
	crosshiar.visible = true
	crosshiar.draw_grid(pattern)
	ui.load_card(self)
	
	pass # Replace with function body.


func _on_button_button_up() -> void:
	if (global_position.y > get_viewport_rect().size.y - 128):
		dragging = false
		ofset = Vector2(0, 0)
		modulate.a = 1
		crosshiar.visible = false
	if (dragging):
		dragging = false
		ofset = Vector2(0, 0)
		modulate.a = 1
		crosshiar.visible = false
		dura -= 1
		summon_damage(randi_range(dmglow, dmghigh))
		
		if (dura > 0):
			$"/root/Inventory".deck.push_back(self)
			get_parent().remove_child(self)
		else:
			queue_free()
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if (dragging):
		if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT):
			dragging = false
			ofset = Vector2(0, 0)
			modulate.a = 1
			crosshiar.visible = false
			
func summon_damage(damage : int):
	var bodies
	for box in crosshiar.grid:
		if (box.visible):
			bodies = box.get_overlapping_bodies()
			if (!bodies.is_empty()):
				bodies[0].die()
