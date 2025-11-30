extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 500.0
const JUMP_VELOCITY = -900.0 
var MAX_JUMPS := 2     
var jumps_left:= 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y > 0:
			animated_sprite.play("fall")
		else:
			animated_sprite.play("jump")
		
	else:
		jumps_left = MAX_JUMPS
		if velocity.x != 0 :
			animated_sprite.play("walk")
		else :
			animated_sprite.play("default")
			 
	# Handle jump.
	if Input.is_action_just_pressed("jump") and  jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1
		animated_sprite.play("jump")

	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")

	if direction==-1:
		animated_sprite.flip_h=true
	elif direction==1:
		animated_sprite.flip_h=false
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/15)

	move_and_slide()

func bounce(strength:int)->void:
		velocity.y = strength
		jumps_left = 1
		animated_sprite.play("jump")

func float_to_height(target_y: float, float_speed: float = -950.0) -> void:
	if position.y > target_y:
		bounce(float_speed)
		animated_sprite.play("fall")
	else:
		velocity.y = 0
		animated_sprite.play("fall")
