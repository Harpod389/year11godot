extends Node2D

@onready var world = get_node("/root/World")

@onready var enemy_spawner: Node2D = $"."



@export var KidEnemyZombie :PackedScene
@export var SkinnyEnemyZombie :PackedScene
var spawn_points := []
var enemy_type 
signal wave_finished
@export var wave_counter = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children(): 
		if i is Marker2D:
			spawn_points.append(i)
	#PlayerStats.wave_finished.connect(next_wave)
	call_deferred("next_wave")
	

func next_wave():
	first_wave()
	await PlayerStats.wave_finished
	second_wave()
	await PlayerStats.wave_finished
	
func first_wave():
	$Timer.start()
	enemy_type = KidEnemyZombie
	wave_counter = 5
	PlayerStats.enemy_left = wave_counter


func second_wave():
	$Timer.start()
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
	########################FIX BELOW
	#elif wave_counter <= 0:
		#print("Level up")
		#PlayerStats.level_up_player()
		#$Timer.stop()
		#await get_tree().create_timer(3).timeout
		#second_wave()
