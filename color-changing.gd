extends Sprite2D

var current_time = 0
var last_update = 0
var is_blue = true

func _ready() -> void:
	modulate = Color.BLUE

func _process(delta: float) -> void:
	current_time += delta
	if current_time - last_update >= 1:
		is_blue = not(is_blue)
		last_update = current_time
		if is_blue:
			modulate = Color.BLUE
		else:
			modulate = Color.RED
