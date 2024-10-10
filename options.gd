extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HScrollBar.value = $"/root/Inventory".music
	$HScrollBar2.value = $"/root/Inventory".sfx
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_h_scroll_bar_value_changed(value: float) -> void:
	$"/root/Inventory".music = value
	$"/root/Inventory".changed_music(self)
	pass # Replace with function body.


func _on_h_scroll_bar_2_value_changed(value: float) -> void:
	$"/root/Inventory".sfx = value
	$"/root/Inventory".changed_sfx(self)
	pass # Replace with function body.
	
func _input(event: InputEvent) -> void:
	if (event is InputEventKey and event.is_pressed() and event.keycode == KEY_ESCAPE):
		visible = !visible
