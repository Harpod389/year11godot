extends Area2D

var speed = 750
#This function ensures that the Bullet speed from the player stats actually updates
func _physics_process(delta):
	position += transform.x * WeaponGun.gun_speed * delta


#This function is responsible for making sure that the bullet does not escape from the player, but is also responsible for registering the damage to all types of enemy zombies
func _on_body_entered(body):
	if body.is_in_group("Player"):
		return
	if body.is_in_group("Enemy"):
		body.has_method("take_damage")
		body.take_damage(WeaponGun.gun_damage)
		#print("send damage")
	queue_free() 
	
