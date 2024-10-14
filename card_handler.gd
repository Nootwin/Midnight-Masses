extends Node2D
@onready var scsizex = get_viewport_rect().size.x / 2.0
@onready var scsizey = get_viewport_rect().size.y
var maxDamage : bool = false
var handLimit : int
var fistCard : WeaponCardBattle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	handLimit = 4 + $"/root/Inventory".inte
	$"/root/Inventory".deck.shuffle()
	fistCard = load("res://cardbattle.tscn").instantiate()
	fistCard.dmghigh = 2
	fistCard.dmglow = 1
	fistCard.dura = 1
	fistCard.range = 1
	fistCard.pattern = [false, false, false, false, false, false, false, true, false, false, false, false, false, false, false,false, false, false, false, false,false, false, false, false, false,]
	fistCard.scale = Vector2(4, 4)
	fistCard.texture = load("res://art/cards/fist.png")
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
	if (get_child_count() < handLimit):
		while (get_real_children() < handLimit):
			draw_card()
			await get_tree().create_timer(0.3).timeout
	else:
		draw_card()
			
func draw_card():
	var card
	
	$"../AudioStreamPlayer2".play()
	if ($"/root/Inventory".deck.size() > 0):
		card = $"/root/Inventory".deck.pop_front()
	else:
		card = fistCard.duplicate(5)
	add_child(card)
	card.visible = true

func get_real_children():
	var x = 0
	for child in get_children():
		if (!child is DamageCard):
			x += 1
			
	return x	
