class_name SpellCardBattle extends CardBattle

@onready var player = $"/root/Node2D/BattleEssentials/TurnHandler/Bplayer"
@onready var inv = $"/root/Inventory"


func _physics_process(delta: float) -> void:
	if (dragging):
		global_position = get_global_mouse_position() - ofset
			
		
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
		_spell_use()
		
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
			
func _spell_use():
	pass
