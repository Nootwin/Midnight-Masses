class_name CardBattle extends Sprite2D
var dragging = false
var ofset : Vector2
var crosshiar
var ui
@onready var halfdim = get_viewport_rect().size / 2


@export var dura : int



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _enter_tree() -> void:
	ui = $"../../BattleUI"
	crosshiar = $"/root/Node2D/BattleEssentials/TurnHandler/Bplayer/Boxes"	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _physics_process(delta: float) -> void:
	if (dragging):
		global_position = get_global_mouse_position() - ofset
		var dis = global_position - halfdim
			
		
func _on_button_button_down() -> void:
	ofset = get_global_mouse_position() - global_position
	modulate.a = 0.5
	dragging = true
	ui.load_card(self)
	
	pass # Replace with function body.


func _on_button_button_up() -> void:
	if (global_position.y > get_viewport_rect().size.y - 128 or crosshiar.get_parent().ap < 1):
		dragging = false
		ofset = Vector2(0, 0)
		modulate.a = 1
	if (dragging):
		$"../../AudioStreamPlayer".play()
		dragging = false
		ofset = Vector2(0, 0)
		modulate.a = 1
		dura -= 1
		
		if (dura > 0):
			$"/root/Inventory".add_to_deck(self)
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
			
