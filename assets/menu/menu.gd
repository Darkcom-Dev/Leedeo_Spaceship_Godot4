extends Control


func _on_menu_start_pressed():
	get_tree().change_scene_to_file("res://assets/level/level.tscn")


func _on_menu_exit_pressed():
	get_tree().quit()
