extends Node2D

@onready var label: Label = $player/Camera2D/CanvasLayer/Control/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Autoload.score=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		label.text = "%s melons" % Autoload.score
		if Autoload.score==8:
			label.text = "You win!!"
			await get_tree().create_timer(5).timeout
			get_tree().reload_current_scene()# Replace with function body.
