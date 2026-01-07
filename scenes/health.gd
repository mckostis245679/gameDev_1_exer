extends MarginContainer

@onready var healthbar=$NinePatchRect

func _process(delta: float) -> void:
	var hp_ratio = Autoload.current_health / Autoload.max_health
	var original_min_x = 300  # set this to the full width of your health bar
	healthbar.custom_minimum_size.x = original_min_x * hp_ratio
