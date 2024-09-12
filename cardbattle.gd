extends Sprite2D
var dragging = false
var ofset : Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if (dragging):
		global_position = get_global_mouse_position() - ofset

func _on_button_button_down() -> void:
	ofset = get_global_mouse_position() - global_position
	dragging = true
	
	pass # Replace with function body.


func _on_button_button_up() -> void:
	dragging = false
	ofset = Vector2(0, 0)
	pass # Replace with function body.
