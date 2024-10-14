extends Node2D

@export var next_scene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"/root/Inventory".newday()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if (event is InputEventKey and event.keycode == KEY_3):
		get_tree().change_scene_to_packed(next_scene)
