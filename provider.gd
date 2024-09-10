class_name Provider extends StaticBody2D

@export var health : int
@export var dispenseEvery : int
var remainder : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_hit(item : Item):
	print("here")
	var damage = randi_range(item.damagelow, item.damagehigh)
	take_damage(damage)


func take_damage(damage : int):
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
