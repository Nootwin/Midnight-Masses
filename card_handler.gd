extends Node2D
@onready var scsizex = get_viewport_rect().size.x / 2.0
@onready var scsizey = get_viewport_rect().size.y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var cards = get_children()
	var size = cards.size()
	var card
	var offset = -(size / 2.0 - 0.5)
	
	for i in size:
		card = cards[i]
		card.global_position = Vector2(scsizex + ((offset + i) * 96), scsizey - 64)
		
