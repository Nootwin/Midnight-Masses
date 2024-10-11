extends Label

@export_enum("Strength", "Intelligence", "Dexterity", "Vitality") var stat : String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (stat == "Strength"):
		text = str($"/root/Inventory".str)
	elif (stat == "Intelligence"):
		text = str($"/root/Inventory".inte)
	elif (stat == "Dexterity"):
		text = str($"/root/Inventory".dex)
	else:
		text = str($"/root/Inventory".vit)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if (stat == "Strength" and $"/root/Inventory".availPoints > 0):
		$"/root/Inventory".availPoints -= 1
		$"/root/Inventory".str += 1
		text = str($"/root/Inventory".str)
		$"../Label10".text = "Available Points: " + str($"/root/Inventory".availPoints)
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	if (stat == "Intelligence" and $"/root/Inventory".availPoints > 0):
		$"/root/Inventory".availPoints -= 1
		$"/root/Inventory".inte += 1
		text = str($"/root/Inventory".inte)
		$"../Label10".text = "Available Points: " + str($"/root/Inventory".availPoints)
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	if (stat == "Dexterity" and $"/root/Inventory".availPoints > 0):
		$"/root/Inventory".availPoints -= 1
		$"/root/Inventory".dex += 1
		text = str($"/root/Inventory".dex)
		$"../Label10".text = "Available Points: " + str($"/root/Inventory".availPoints)
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	if (stat == "Vitality" and $"/root/Inventory".availPoints > 0):
		$"/root/Inventory".availPoints -= 1
		$"/root/Inventory".vit += 1
		text = str($"/root/Inventory".vit)
		$"../Label10".text = "Available Points: " + str($"/root/Inventory".availPoints)
	pass # Replace with function body.
