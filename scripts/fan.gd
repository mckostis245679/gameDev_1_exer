extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var max_height := -200.0      # The highest Y-position the fan can push player to
var float_force := -400.0     # Upward speed while in the fan
var hover_gravity := 50.0     # Lower gravity inside fan (so you float smoothly)

func _ready() -> void:
	# Make sure your trampoline starts idle
	animated_sprite.play("off")

func _on_body_entered(body: Node2D) -> void:
		animated_sprite.play("on")
		body.float_to_height(max_height)



func _on_body_exited(body: Node2D) -> void:
	await get_tree().create_timer(4).timeout
	animated_sprite.play("off")
