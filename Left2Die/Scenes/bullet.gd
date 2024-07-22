extends Area2D

var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free() 
	
func _on_body_entered(animated_sprite_2d):
	if animated_sprite_2d. get_name() == "KidEnemeyZombie":
		queue_free()
