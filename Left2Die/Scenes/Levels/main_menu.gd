extends Control


func _ready():
	pass 

#This function applies to the main menu: When the player presses the start button on the screen, they are directed to the main world where they can start playing 
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/world.tscn")



#This function also applies to the main menu: When the player presses the quit buttin, they close the gane application
func _on_quit_button_pressed() -> void:
	get_tree().quit()
