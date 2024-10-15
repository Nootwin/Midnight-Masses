extends TextureRect

var where = -4
@onready var mod = $"../../../../CanvasModulate"
@onready var light = $"../../../../PointLight2D"

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
	mod.color.r = -0.006 * where + 1
	mod.color.b = where / 62
	light.energy = -0.0004 * (where-20)**2 + 0.6
	if (where > 61):
		$"/root/Inventory".enviroment.get_parent().remove_child($"/root/Inventory".enviroment)
		get_tree().change_scene_to_packed($"/root/Node2D/Essentials".next_scene)
	elif (where > 31):
		mod.color.g = -0.022 * (where-31) + 1
	pass # Replace with function body.
