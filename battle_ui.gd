extends Control

@onready var HP = $ColorRect/HP
@onready var AP = $ColorRect/AP
@onready var STEPS = $ColorRect/MOVE
@onready var DMG = $ColorRect/DMG
@onready var RNG = $ColorRect/RANGE
@onready var DUR = $ColorRect/DURA
@onready var DECKSIZE = $TextureRect/SIZE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	HP.text = "HP: " + str($"/root/Node2D/BattleEssentials/TurnHandler/Bplayer".health)
	AP.text = "AP: " + str($"/root/Node2D/BattleEssentials/TurnHandler/Bplayer".ap)
	STEPS.text = "STEPS: " + str($"/root/Node2D/BattleEssentials/TurnHandler/Bplayer".steps)
	DECKSIZE.text = str($"/root/Inventory".deck.size())
	pass

func load_card(card : CardBattle):
	DMG.text = "DMG: \n" + str(card.dmglow) + "-" + str(card.dmghigh)
	RNG.text = "RANGE: \n" + str(card.range)
	DUR.text = "DURA: \n" + str(card.dura)
	
