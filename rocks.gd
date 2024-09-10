extends Provider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_hit(item : Item):
	print("here")
	var damage = randi_range(item.damagelow, item.damagehigh)
	if (item.isPickAxe):
		damage *= 3
	take_damage(damage)
	
func dispense(amount):
	$"/root/Inventory".rock += amount
