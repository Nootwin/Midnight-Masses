extends TextureRect

var where = -4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	position.x = where


func increase(val) -> void:
	where += val
	if (where > 61):
		var env = $"../../../../../enviroment"
		env.get_parent().remove_child(env)
		$"/root/Inventory".enviroment = env
		get_tree().change_scene_to_packed($"/root/Node2D/Essentials".next_scene)
	pass # Replace with function body.
