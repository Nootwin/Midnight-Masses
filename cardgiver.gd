extends Provider

func dispense(amount):
	if ($"/root/Inventory" != null):
		super.dispense(amount)
		$AudioStreamPlayer2D.play()
		if (amount > 0):
			$"/root/Inventory".add_to_deck($Spell.duplicate(5))
