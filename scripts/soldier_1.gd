extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var visionraycast: RayCast2D = $visionraycast
@onready var area_2d: Area2D = $area2d
@onready var kill_enemy: Area2D = $kill_enemy
@export var strength: float = -1400.0

var speed:=80.0
var direction:=1
var isdead=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isdead:
		return
	animated_sprite.play("default")
	if ray_cast_2d.is_colliding():
		direction*=-1
		animated_sprite.flip_h=not animated_sprite.flip_h
		ray_cast_2d.scale.x*=-1
		visionraycast.scale*=-1
		
	if visionraycast.is_colliding():
		speed=360.0
	else :
		speed=120.0
	position.x+=delta*speed*direction


func _on_area_2d_body_entered(body: Node2D) -> void:
	kill_enemy.monitoring = false
	Autoload.current_health-=0.5



func _on_kill_enemy_body_entered(body: Node2D) -> void:
	isdead=true
	speed = 0
	direction = 0
	Autoload.enemies_killed+=1
	ray_cast_2d.enabled = false
	visionraycast.enabled = false
	area_2d.monitoring = false
	kill_enemy.monitoring = false
	animated_sprite.play("death")
	AudioController.play_enemyDeath()
	body.bounce(strength)
	await animated_sprite.animation_finished

	queue_free()
