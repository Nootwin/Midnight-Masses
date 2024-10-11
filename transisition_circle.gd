extends PointLight2D
var go = false
var scene : PackedScene

# Called when the node enters the scene tree for the first time.
func start(scene : PackedScene):
	get_tree().paused = true
	self.scene = scene
	go = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if (go):
		if (texture_scale < 0.2):
			get_tree().paused = false
			get_tree().change_scene_to_packed(scene)
		texture_scale -= 0.15
	elif (texture_scale < 13.21):
		texture_scale += 0.15
	pass
