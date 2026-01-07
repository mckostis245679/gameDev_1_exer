extends Node2D

@onready var label: Label =$player/Camera2D/CanvasLayer/Control/Label

func _ready() -> void:
	Autoload.melons=0
	Autoload.enemies_killed=0
	Engine.time_scale=1
	Autoload.current_health=3.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text=str(Autoload.melons)
	if Autoload.melons==8:
		label.text="You win!!"
		await get_tree().create_timer(5).timeout
		get_tree().reload_current_scene()# Replace with function body.
