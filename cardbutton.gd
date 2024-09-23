class_name CardButton extends TextureButton

@onready var node = $"/root/Node2D/Essentials/CanvasLayer2/Control"
@export var cardName : String
@export var wood : int
@export var rock : int
@export var iron : int
@export var dmglow : int
@export var dmghigh : int
@export var range : int
@export var cardscene : CardBattle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

	
	
func _on_pressed() -> void:
	node.currentCard = self
	node.updateCurrentCard()
	pass # Replace with function body.
