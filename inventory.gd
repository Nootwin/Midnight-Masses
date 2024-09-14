extends Node2D

var wood : int
var rock : int
var iron : int
var deck : Array[CardBattle]
var lastday : PackedScene
var lastdeck : Array[CardBattle]
@onready var damageCard = preload("res://damage_card.tscn").instantiate()
var enviroment : Node2D = Node2D.new()

func add_to_deck(card : CardBattle):
	deck.push_back(card)
	
func damage(amount : int):
	for i in amount:
		deck.insert(randi_range(0, deck.size()), damageCard.duplicate(5))
	
func newday(rootnode):
	lastday = load(rootnode.get_scene_file_path())
	lastdeck = deck.duplicate()
	
func restore():
	deck = lastdeck.duplicate()
