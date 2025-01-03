extends Control

var currentCard : CardButton
@onready var costwood = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel5
@onready var costrock = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel6
@onready var costiron = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel11
@onready var statname = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel10
@onready var statdmg = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel8
@onready var statrng = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/RichTextLabel9
@onready var craftbutton = $MarginContainer/TabContainer/Craft/HSplitContainer/Panel/Button
@onready var craftgrid = $MarginContainer/TabContainer/Craft/HSplitContainer/MarginContainer/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var inv = $"/root/Inventory"
	_ressources_added(inv.wood, inv.rock, inv.iron)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func updateCurrentCard():
	costwood.text = str(currentCard.wood)
	costrock.text = str(currentCard.rock)
	costiron.text = str(currentCard.iron)
	statname.text = "NAME: \n" + currentCard.cardName
	statdmg.text = "DMG: \n" + str(currentCard.dmglow) + "-" + str(currentCard.dmghigh)
	statrng.text = "RANGE: \n" + str(currentCard.range)
	
func _input(event: InputEvent) -> void:
	if (event is InputEventKey and event.keycode == KEY_E and event.is_pressed()):
		visible = !visible

func _ressources_added(wood, rock, iron : int):
	for cards in craftgrid.get_children():
		if (wood < cards.wood || rock < cards.rock || iron < cards.iron):
			cards.modulate.a = 0.5
		else:
			cards.modulate.a = 1
	pass

func _on_button_pressed() -> void:
	if (currentCard != null and currentCard.wood <= $"/root/Inventory".wood and currentCard.rock <= $"/root/Inventory".rock and currentCard.iron <= $"/root/Inventory".iron):
		
		$"/root/Inventory".wood -= currentCard.wood
		$"/root/Inventory".rock -= currentCard.rock
		$"/root/Inventory".iron -= currentCard.iron
		$"/root/Inventory".add_to_deck(currentCard.cardscene.duplicate(5))
		$AudioStreamPlayer.play()
		_ressources_added($"/root/Inventory".wood, $"/root/Inventory".rock, $"/root/Inventory".iron)
	pass # Replace with $AudioStreamPlayerfunction body.
