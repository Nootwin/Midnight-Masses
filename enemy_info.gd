extends RichTextLabel

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_zombie_mouse_entered() -> void:
	print("here")
	text = "HP: " + str(get_parent().health) + "\nDMG: 1" 
	visible = true


func _on_zombie_mouse_exited() -> void:
	visible = false
