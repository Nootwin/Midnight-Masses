extends Button

var level : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = $"/root/Inventory".lastday
	$"/root/Inventory".restore()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_pressed():	
	get_tree().change_scene_to_packed(level)