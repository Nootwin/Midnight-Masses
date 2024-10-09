extends RichTextLabel

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_zombie_mouse_entered() -> void:
	print("here")
	text = "HP: " + str(get_parent().health) + "\nDMG: " + str(get_parent().dmg) + "\nSTEPS: " + str(get_parent().maxsteps)
	visible = true
	$"../AreaSpawner".visible = true


func _on_zombie_mouse_exited() -> void:
	visible = false
	$"../AreaSpawner".visible = false
