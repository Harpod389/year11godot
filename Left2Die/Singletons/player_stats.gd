extends Node

var player_level = 1 
var player_experience = 0 
var player_health = 100
var player_max_health = 100 
var next_level = 15 
var enemy_left = 0
signal level_up 
signal add_xp 
signal wave_finished

func level_up_player():
	player_level+=1
	next_level = next_level + 10 
	player_experience= 0 
	emit_signal("level_up")
	
	
func add_max_health():
	player_max_health += 20
	player_health = player_max_health
	emit_signal("taiedamage")

func enemy_killed():
	enemy_left -=1
	if enemy_left <= 0:
		PlayerStats.level_up_player()
		emit_signal("wave_finished")
#func add_expirience(val):
	#player_experience += val 
	#emit_signal("add_xp")
	#if player_experience >= next_level:
		#level_up_player()
	
