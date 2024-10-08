extends Control

@onready var worldlabel = $Panel/Label
@onready var worldgrid = $Panel/GridContainer
@onready var worldname = $Panel/Label3

func _ready() -> void:
	loadWorld($"../../Worlds/0")


func loadWorld(world : Node2D):
	worldlabel.text = "World: " + world.name
	worldname.text = world.stringname
	worldgrid.get_child(0).texture = world.card1
	worldgrid.get_child(1).texture = world.card2
	worldgrid.get_child(2).texture = world.card3
