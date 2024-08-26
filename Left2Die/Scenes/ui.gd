extends CanvasLayer

@onready var wave_finsihed_notice: PanelContainer = $Control/WaveFinsihedNotice



func level_up():
	wave_finsihed_notice.visible = true 

func _on_wave_finsihed_notice_visibility_changed() -> void:
	if wave_finsihed_notice.visibile == true:
		get_tree().paused = true 
	else:
		get_tree().paused = false
		
