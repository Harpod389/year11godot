extends Node

var gun_wave = 1 
var gun_damage = 3
var gun_speed = 500 
var gun_projectiles = 1 
var gun_time = 0.8
var gun_knockback = 10 

func level_up_gun():
	gun_wave +=1
	match gun_wave: 
		1: 
			pass
		2:
			gun_damage = 5
			gun_speed = 500 
			gun_projectiles = 2 
			gun_time = 0.8
			gun_knockback = 15
		3: 
			gun_damage = 8
			gun_speed = 500 
			gun_projectiles = 2 
			gun_time = 0.5
			gun_knockback = 20

