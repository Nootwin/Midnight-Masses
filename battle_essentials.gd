extends Node2D

var next_scene : String = "res://worldmap.tscn"
@export var levelID : int
@export var pointsGiven : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _completeLevel():
	$"/root/Inventory".lastBeatDay = levelID
	$"/root/Inventory".levelcomp[levelID] = true
	$CanvasLayer/BattleUI/Panel/RichTextLabel2.text += str(pointsGiven)
	$CanvasLayer/BattleUI/Panel.visible = true
	
	pass
