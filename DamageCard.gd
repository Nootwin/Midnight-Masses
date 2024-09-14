class_name DamageCard extends CardBattle

var viewport
var movement
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if (global_position == viewport):
		crosshiar.get_parent().damage(1)
		queue_free()
	global_position.x = move_toward(global_position.x, viewport.x, movement.x)
	global_position.y = move_toward(global_position.y, viewport.y, movement.y)
	
	
func _enter_tree() -> void:
	viewport =  get_viewport_rect().size/2
	movement = Vector2(viewport.x / 48, viewport.y / 48)
	global_position = viewport * 2
	global_position -= Vector2(100, 100)
	
func _on_button_button_down() -> void:
	pass


func _on_button_button_up() -> void:
	pass
func _input(event: InputEvent) -> void:
	pass
			
func summon_damage(damage : int):
	pass
