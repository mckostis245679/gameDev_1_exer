extends MarginContainer

@onready var anim=$AnimationPlayer
@onready var  popupmenu=$"."
@onready var mainmenu=$mainmenu
@onready var help=$help
@onready var settings=$settings

# Called when the node enters the scene tree for the first time.
func toggle_visibility(object) -> void:
	if object.visible==true:
		anim.play("close_"+str(object.name))
	else:
		anim.play("open_"+str(object.name))
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("open_menu") && popupmenu.visible==true :
		Engine.time_scale=1
		AudioController.play_closemenu()
		anim.play("close_mainmenu")
		await get_tree().create_timer(0.5).timeout
		close_all_menus()

	elif Input.is_action_just_pressed("open_menu"):
		Engine.time_scale=1
		close_all_menus()
		popupmenu.visible=true
		anim.play("open_mainmenu")
		AudioController.play_openmenu()
		
func _on_helpbutton_pressed() -> void:
	toggle_visibility(help)
	mainmenu.visible=false
	
func _on_next_level_pressed() -> void:
	if Autoload.level!=Autoload.maxlevel :
		Autoload.level+=1
	get_tree().change_scene_to_file("res://scenes/level_"+str(Autoload.level)+".tscn")

func close_all_menus() ->void:
	help.visible=false
	mainmenu.visible=false
	settings.visible=false
	popupmenu.visible=false

func _on_quit_pressed() -> void:
	close_all_menus()

func _on_settings_pressed() -> void:
	toggle_visibility(settings)
	mainmenu.visible=false


func _on_exithelp_pressed() -> void:
	toggle_visibility(help)
	await get_tree().create_timer(0.5).timeout
	mainmenu.visible=true


func _on_exitsettings_pressed() -> void:
	toggle_visibility(settings)
	await get_tree().create_timer(0.5).timeout
	mainmenu.visible=true
