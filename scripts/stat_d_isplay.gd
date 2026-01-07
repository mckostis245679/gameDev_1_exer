extends VBoxContainer

@onready var melon_display=$MelonDisplay
@onready var score_display=$ScoreDisplay

var melons:String =str(84)
var score:String =str(1928)

# Called when the node enters the scene tree for the first time.
func update_text() -> void:
	melon_display.text=("MELONS - "+ str(Autoload.melons))
	score_display.text=("KILLED - "+str(Autoload.enemies_killed))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_text()
