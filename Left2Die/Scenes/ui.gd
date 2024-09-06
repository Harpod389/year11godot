extends CanvasLayer

@onready var wave_finsihed_notice: PanelContainer = $Control/WaveFinsihedNotice



@onready var experience = $Control/Experience
@onready var health = $Control/Health
@onready var speed = $Control/Speed




func _ready():
	PlayerStats.level_up.connect(level_up)
	PlayerStats.add_xp.connect(update_xp)
	PlayerStats.take_damage.connect(update_health)
	PlayerStats.speed.connect(update_speed)


func update_speed():
	speed.max_value = PlayerStats.next_SPEED
	speed.value = PlayerStats.SPEED
	

func update_xp():
	experience.max_value = PlayerStats.next_level
	experience.value = PlayerStats.player_experience

func update_health():
	print("updating health")
	health.max_value = PlayerStats.player_max_health
	health.value = PlayerStats.player_health


func level_up():
	wave_finsihed_notice.visible = true 
	#await wave_finsihed_notice
	#$CanvasLayer/Label2.visible = true
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


func _on_btn_speed_level_pressed() -> void:
	PlayerStats.level_up_speed()
	wave_finsihed_notice.visible= false 
