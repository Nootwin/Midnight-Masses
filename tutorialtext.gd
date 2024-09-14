extends Control

@export var texts : Array[String]
var text = 0
var letter = 0
@onready var timer = $Timer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_text()
	get_tree().paused = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.is_pressed()):
		text += 1
		if (text < texts.size()):
			timer.stop()
			change_text()
		else:
			get_tree().paused = false
			queue_free()
			
func change_text():
	letter = 0
	timer.start(0.03)
	$Panel/RichTextLabel.text = texts[text][letter]
	

func _on_timer_timeout() -> void:
	letter += 1
	if (text < texts.size() and letter < texts[text].length()):
		$Panel/RichTextLabel.text += texts[text][letter]
		timer.start(0.03)
	pass # Replace with function body.
