extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemySpawner.first_wave()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $EnemySpawner.wave_counter <= 0:
		var enemies_remaining = get_tree().get_nodes_in_group("Enemy")
		if len(enemies_remaining) == 0:
			print("wave over")
			


