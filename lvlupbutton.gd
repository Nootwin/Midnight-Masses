extends Button

var time : float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	$"../Panel2".visible = !$"../Panel2".visible
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if ($"/root/Inventory".availPoints > 0):
		if (time > 0.25):
			if (get_theme_stylebox("normal").bg_color == Color(0.62, 0.482, 0.278)):
				get_theme_stylebox("normal").bg_color = Color(0.267, 0.5, 0.869)
			else:
				get_theme_stylebox("normal").bg_color = Color(0.62, 0.482, 0.278)
			time = 0
		else:
			time += delta
	else:
		get_theme_stylebox("normal").bg_color = Color(0.62, 0.482, 0.278)
