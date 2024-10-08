extends Node2D
@onready var scsizex = get_viewport_rect().size.x / 2.0
@onready var scsizey = get_viewport_rect().size.y
var maxDamage : bool = false
var handLimit : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"/root/Inventory".handLimit = 4 + $"/root/Inventory".inte
	$"/root/Inventory".deck.shuffle()
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
		if (!card is DamageCard):
			card.global_position = Vector2(scsizex + ((offset + i) * 96), scsizey - 64)
		
func draw_cards():
	if ($"/root/Inventory".deck.size() > 0):
		pass
	if (get_child_count() < handLimit):
		while (get_real_children() < 4 and $"/root/Inventory".deck.size() > 0):
			draw_card()
			await get_tree().create_timer(0.3).timeout
	else:
		if ($"/root/Inventory".deck.size() > 0):
			draw_card()
			
func draw_card():
	var card
	$"../AudioStreamPlayer2".play()
	card = $"/root/Inventory".deck.pop_front()
	add_child(card)
	card.visible = true

func get_real_children():
	var x = 0
	for child in get_children():
		if (!child is DamageCard):
			x += 1
			
	return x	
