extends Control

@onready var worldlabel = $Panel/Label


func load(world : Node2D):
	worldlabel.text = "World: " + world.name
