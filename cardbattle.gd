class_name CardBattle extends Sprite2D
var dragging = false
var ofset : Vector2
@onready var crosshiar = $"/root/Node2D/TurnHandler/Bplayer/Boxes"
@onready var ui = $"../../BattleUI"

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
		var dis = global_position - crosshiar.global_position
		print(global_position, crosshiar.global_position)
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

func _on_button_button_down() -> void:
	ofset = get_global_mouse_position() - global_position
	modulate.a = 0.5
	dragging = true
	crosshiar.visible = true
	crosshiar.draw_grid(pattern)
	ui.load_card(self)
	
	pass # Replace with function body.


func _on_button_button_up() -> void:
	dragging = false
	ofset = Vector2(0, 0)
	modulate.a = 1
	crosshiar.visible = false
	pass # Replace with function body.
