class_name Provider extends StaticBody2D

var health = 24
var dispenseEvery = 6
var remainder = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_hit(item : Item):
	var damage = randi_range(item.damagelow, item.damagehigh)
	if (item.isAxe):
		damage *= 3
	take_damage(damage)


func take_damage(damage):
	health -= damage
	var dis = remainder + damage
	dispense(dis / dispenseEvery)
	remainder = dis % dispenseEvery
	if (health < 0):
		die()
	
func dispense(amount):
	pass
	
func die():
	queue_free()
