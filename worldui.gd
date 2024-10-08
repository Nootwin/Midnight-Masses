extends Control

@onready var worldlabel = $Panel/Label
@onready var worldgrid = $Panel/GridContainer


func load(world : Node2D):
	worldlabel.text = "World: " + world.name
	worldgrid
