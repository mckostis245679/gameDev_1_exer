extends Area2D



func _on_body_entered(body: Node2D) -> void:
	queue_free()
	Autoload.melons+=1
	AudioController.play_melon()
	pass # Replace with function body.
