extends Node2D
@onready var turnOrder = get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func next():
	turnOrder.back().isturn = false
	var nex = turnOrder.pop_front()
	nex.isturn = true
	nex.start_turn()
	turnOrder.push_back(nex)
	
