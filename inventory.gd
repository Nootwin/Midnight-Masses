extends Node2D

var wood : int
var rock : int
var iron : int
var lastwood : int
var lastrock : int
var lastiron : int
var deck : Array[CardBattle]
var lastday : PackedScene
var lastdeck : Array[CardBattle]
@onready var damageCard = preload("res://damage_card.tscn").instantiate()
var enviroment : Node2D = Node2D.new()

var str : int =  0
var inte : int =  0
var dex : int =  0
var vit : int = 0
var pointsleft : int = 0
var levelcomp = [false, false, false, false, false, false, false, false, false]

func _on_ressource_added():
	$"/root/Node2D/Essentials/CanvasLayer2/Control"._ressources_added(wood, rock, iron)

func add_to_deck(card : CardBattle):
	var canvas
	if (get_node_or_null("/root/Node2D/Essentials") != null):
		canvas = $"/root/Node2D/Essentials/CanvasLayer"
	else:
		canvas = $"/root/Node2D/BattleEssentials/CanvasLayer"
		
	var fakecard = FakeCard.new()
	fakecard.texture = card.texture
	fakecard.scale = Vector2(4, 4)
	canvas.add_child(fakecard)
	fakecard.position = Vector2(1100, 500)
	deck.push_back(card)
	
func damage(amount : int):
	for i in amount:
		deck.insert(randi_range(0, deck.size()), damageCard.duplicate(5))
	
func newday(rootnode):
	lastwood = wood
	lastrock = rock
	lastiron = iron
	lastday = load(rootnode.get_scene_file_path())
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
