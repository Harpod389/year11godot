extends Area2D

var speed = 750

func _physics_process(delta):
	position += transform.x * WeaponGun.gun_speed * delta



func _on_body_entered(body):
	if body.is_in_group("Player"):
		return
	if body.is_in_group("Enemy"):
		body.has_method("take_damage")
		body.take_damage(WeaponGun.gun_damage)
		#print("send damage")
	queue_free() 
	
