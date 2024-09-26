extends Node

var player_level = 1 
var player_experience = 0 
var player_health = 100
var player_max_health = 100 
var next_level = 15 
var enemy_left = 0
var SPEED = 150
var next_SPEED= 20
signal level_up 
signal add_xp 
signal wave_finished
signal take_damage
signal speed

#This function makes sure that the player levels up
func level_up_player():
	player_level+=1
	next_level = next_level + 10 
	player_experience= 0 
	emit_signal("level_up")
	
	
	#This function updates the player health in their stats 
func add_max_health():
	player_max_health += 20
	player_health = player_max_health
	emit_signal("take_damage")

#This function levels up the speed of the player if they click that option on the level up notice
func level_up_speed():
	SPEED += 100
	next_SPEED= SPEED
	emit_signal("speed")


func reset():
	player_level = 1 
	player_experience = 0
	player_health = 100
	player_max_health = 100 
	next_level = 15 
	enemy_left = 0
	next_SPEED= 20


#This function makes sure that once the enemies are dead, wave finished notice apears
func enemy_killed():
	enemy_left -=1
	if enemy_left <= 0:
		PlayerStats.level_up_player()
		emit_signal("wave_finished")
func add_expirience(val):
	player_experience += val 
	emit_signal("add_xp")
	if player_experience >= next_level:
		level_up_player()
	#This function registers the player health in the player stats 
func damage_player(amount):
	print("damaged")
	player_health -= amount
	emit_signal("take_damage")
