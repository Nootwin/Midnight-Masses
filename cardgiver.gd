extends Provider

func dispense(amount):
	super.dispense(amount)
	$AudioStreamPlayer2D.play()
	if (amount > 0):
		$"/root/Inventory".add_to_deck($Spell.duplicate(5))
