extends BasicEnemy
#
@onready var bonefile = load("res://bone.tscn")
func _ready() -> void:
	super._ready()
	

func _attack():
	var bone = bonefile.instantiate()
	bone.velocity = global_position.direction_to($"../Bplayer".global_position) * 300
	call_deferred("add_child", bone)
	pass
	
