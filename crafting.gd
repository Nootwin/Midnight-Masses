extends Control

var currentCard : CardButton
@onready var curwood = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel
@onready var currock = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel2
@onready var costwood = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel5
@onready var costrock = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel6
@onready var statname = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel10
@onready var statdmg = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel8
@onready var statrng = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel9
@onready var craftbutton = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	curwood.text = str($"/root/Inventory".wood)
	currock.text = str($"/root/Inventory".rock)
	pass

func _on_button_pressed() -> void:
	pass # Replace with function body.

func updateCurrentCard():
	costwood.text = str(currentCard.wood)
	costrock.text = str(currentCard.rock)
	statname.text = "NAME: \n" + currentCard.cardName
	statdmg.text = "DMG: \n" + str(currentCard.dmglow) + "-" + str(currentCard.dmghigh)
	statrng.text = "RANGE: \n" + str(currentCard.range)
	
func _input(event: InputEvent) -> void:
	if (event is InputEventKey and event.keycode == KEY_E and event.is_pressed()):
		visible = !visible
