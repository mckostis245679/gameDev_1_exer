extends PathFollow2D


var speed: float = 0.15
var direction: int = 1

func _process(delta: float) -> void:
	progress_ratio += delta * speed * direction

	if progress_ratio >= 1.0:
		progress_ratio = 1.0
		direction = -1
	elif progress_ratio <= 0.0:
		progress_ratio = 0
		direction = 1
