extends Node

var gun_wave = 1 
var gun_damage = 3
var gun_speed = 350
var gun_projectiles = 1 
var gun_time = 0.8
var gun_knockback = 10 

#This function updates the gun stats after each wave finished notice 
func level_up_gun():
	gun_wave +=1
	match gun_wave: 
		1: 
			pass
		2:
			gun_damage = 5
			gun_speed = 900 
			gun_projectiles = 2 
			gun_time = 0.8
			gun_knockback = 15
		3: 
			gun_damage = 8
			gun_speed = 500 
			gun_projectiles = 2 
			gun_time = 0.5
			gun_knockback = 20
