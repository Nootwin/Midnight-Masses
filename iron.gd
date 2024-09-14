extends Provider




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func dispense(amount):
	$AudioStreamPlayer2D.play()
	$"/root/Inventory".iron += amount
