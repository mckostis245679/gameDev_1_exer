extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var strength: float = -1400.0

func _ready() -> void:
	# Make sure your trampoline starts idle
	animated_sprite.play("idle")

func _on_body_entered(body: Node2D) -> void:
		animated_sprite.play("bounce")
		body.bounce(strength)
		await animated_sprite.animation_finished
		animated_sprite.play("idle")
