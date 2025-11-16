extends Node2D

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	get_tree().paused = false   # Ensure the menu always works normally

func _on_back_pressed() -> void:
	# If we are in the main menu, this scene is unpaused
	if !get_tree().paused:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	else:
		# Safety case (shouldn't happen)
		get_tree().paused = true
		get_tree().current_scene.get_node("PauseMenu").visible = true
		visible = false

func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
