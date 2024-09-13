extends Node2D

var wood : int
var rock : int
var deck : Array[CardBattle]

func add_to_deck(card : CardBattle):
	deck.push_back(card)
