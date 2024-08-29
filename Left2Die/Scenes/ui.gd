extends CanvasLayer

@onready var wave_finsihed_notice: PanelContainer = $Control/WaveFinsihedNotice

@onready var experience = $Control/Experience
@onready var health = $Control/Health

func _ready():
	PlayerStats.level_up.connect(level_up)
	#PlayerStats.add_xp.connect(update_xp)


func update_xp():
	experience.max_value = PlayerStats.next_level
	#experience.value = PlayerStats.player_experience

	


func level_up():
	wave_finsihed_notice.visible = true 
	update_xp()
	

func _on_wave_finsihed_notice_visibility_changed():
	if wave_finsihed_notice.visible == true:
		get_tree().paused = true 
	else:
		get_tree().paused = false
		


func _on_btn_health_level_pressed():
	PlayerStats.add_max_health()
	wave_finsihed_notice.visible= false
	


func _on_btn_gun_level_pressed() -> void:
	WeaponGun.level_up_gun()
	wave_finsihed_notice.visible= false
