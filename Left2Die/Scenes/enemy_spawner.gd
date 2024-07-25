extends Node2D

@onready var world = get_node("/root/World")

var KidEnemyZombie := preload("res://Scenes/Kid enemy zombie.tscn")
var SkinnyEnemyZombie
var spawn_points := []
var enemy_type
@export var wave_counter = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children(): 
		if i is Marker2D:
			spawn_points.append(i)


func first_wave():
	$Timer.start()
	enemy_type = KidEnemyZombie
	wave_counter = 50

func second_wave():
	$Timer.start
	enemy_type = SkinnyEnemyZombie
	wave_counter = 30

func _on_timer_timeout():
	wave_counter -= 1
	var spawn = spawn_points[randi() % spawn_points.size()]
	var zombie = enemy_type.instantiate()
	zombie.position = spawn.position
	world.add_child(zombie)
	if wave_counter > 0:
		$Timer.start()
