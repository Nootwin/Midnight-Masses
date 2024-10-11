extends Node2D

var wood : int
var rock : int
var iron : int
var lastwood : int
var lastrock : int
var lastiron : int
var deck : Array[CardBattle]
var lastBeatDay : int
var lastdeck : Array[CardBattle]
@onready var damageCard = preload("res://damage_card.tscn").instantiate()
var enviroment : Node2D = Node2D.new()

var str : int =  0
var inte : int =  0
var dex : int =  0
var vit : int = 0
var levelcomp = [true, true, false, false, false, false, false, false, false]
var cantGetHit : bool = false
var availPoints : int = 0

var music = 1.0
var sfx = 1.0

func changed_music(panel):
	if (music > 0):
		panel.get_node("../../AudioStreamPlayer").volume_db = 10 * music - 10
	else:
		panel.get_node("../../AudioStreamPlayer").volume_db = -80
	

func changed_sfx(panel):
	var value
	if (sfx > 0):
		value = sfx * 5 - 5
	else:
		value = -80
	if (get_node_or_null("/root/Node2D/Essentials") != null):
		var goOver = $"/root/Node2D/enviroment"
		for nme in goOver.get_children():
			nme.get_node("AudioStreamPlayer2D").volume_db = value
	elif (get_node_or_null("/root/Node2D/BattleEssentials") != null):
		var goOver = panel.get_node("../../TurnHandler")
		for nme in goOver.get_children():
			if (nme is not BPlayer):
				nme.get_node("AudioStreamPlayer2D").volume_db = value
			else:
				nme.get_node("AudioStreamPlayer").volume_db = value
	elif (get_node("/root/Node2D") is Home):
		var goOver = $"/root/Node2D"
		for nme in goOver.get_children():
			if (nme is Provider):
				nme.get_node("AudioStreamPlayer2D").volume_db = value
func _on_ressource_added():
	$"/root/Node2D/Essentials/CanvasLayer2/Control"._ressources_added(wood, rock, iron)

func add_to_deck(card : CardBattle):
	var canvas
	if (get_node_or_null("/root/Node2D/Essentials") != null):
		canvas = $"/root/Node2D/Essentials/CanvasLayer"
	elif (get_node_or_null("/root/Node2D/BattleEssentials/CanvasLayer") != null):
		canvas = $"/root/Node2D/BattleEssentials/CanvasLayer"
	else:
		canvas = $"/root/Node2D/CanvasLayer"
	var fakecard = FakeCard.new()
	fakecard.texture = card.texture
	if (!card is SpellCardBattle):
		fakecard.scale = Vector2(4, 4)
	canvas.add_child(fakecard)
	fakecard.position = Vector2(1100, 500)
	deck.push_back(card)
	
func add_to_deck_insert(card : CardBattle, pos :int):
	var canvas
	if (get_node_or_null("/root/Node2D/Essentials") != null):
		canvas = $"/root/Node2D/Essentials/CanvasLayer"
	elif (get_node_or_null("/root/Node2D/BattleEssentials/CanvasLayer") != null):
		canvas = $"/root/Node2D/BattleEssentials/CanvasLayer"
	else:
		canvas = $"/root/Node2D/CanvasLayer"
	var fakecard = FakeCard.new()
	fakecard.texture = card.texture
	if (!card is SpellCardBattle):
		fakecard.scale = Vector2(4, 4)
	canvas.add_child(fakecard)
	fakecard.position = Vector2(1100, 500)
	deck.insert(pos, card)
	
	
func damage(amount : int):
	if (!cantGetHit):
		for i in amount:
			add_to_deck_insert(damageCard.duplicate(5), randi_range(0, deck.size()))
			
	
func newday(rootnode):
	lastwood = wood
	lastrock = rock
	lastiron = iron
	for card in deck:
		if (card is DamageCard):
			deck.erase(card)
	lastdeck = deckdup(deck)
	
	
func restore():
	wood = lastwood
	rock = lastrock
	iron = lastiron
	deck = deckdup(lastdeck)

func deckdup(arr : Array[CardBattle]) -> Array[CardBattle]:
	var newdeck : Array[CardBattle]
	for i in arr:
		newdeck.push_back(i.duplicate(5))
		
	return newdeck
