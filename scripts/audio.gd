extends Node2D

@export var mute:=false
# Called when the node enters the scene tree for the first time.
func play_music()->void:
	if not mute:
		$Background.play()

func play_jump()->void:
	if not mute:
		$Jump.play()

func play_playeDeath()->void:
	if not mute:
		$PlayerDeath.play()

func play_enemyDeath()->void:
	if not mute:
		$EnemyDeath.play()
		
func play_melon()->void:
	if not mute:
		$Melon.play()

func play_openmenu()->void:
	if not mute:
		$openmenu.play()
		
func play_closemenu()->void:
	if not mute:
		$closemenu.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	play_music()
