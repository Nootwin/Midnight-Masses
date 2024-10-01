extends Provider

func dispense(amount):
	super.dispense(amount)
	$AudioStreamPlayer2D.play()
	$"/root/Inventory".deck.push($Spell)
