extends Control

@onready var HP = $ColorRect/HP
@onready var AP = $ColorRect/AP
@onready var DMG = $ColorRect/DMG
@onready var RNG = $ColorRect/RANGE
@onready var DUR = $ColorRect/DURA
@onready var DECKSIZE = $TextureRect/SIZE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	DECKSIZE.text = str($"/root/Inventory".deck.size())
	pass

func load_card(card : CardBattle):
	DMG.text = "DMG: \n" + str(card.dmglow) + "-" + str(card.dmghigh)
	RNG.text = "RANGE: \n" + str(card.range)
	DUR.text = "DURA: \n" + str(card.dura)
	
