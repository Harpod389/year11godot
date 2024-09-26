extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var big_enemy_zombie: CharacterBody2D = $"."
@onready var sprite = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("Player")
@export var health = 10 
@onready var HurtBox  = $HurtBox
var dead = false
@onready var damage_timer: Timer = $HurtBox/DamageTimer
@export var damage = 30

#func ready():
	#PlayerStats.enemy_killed().connect(take_damage)

#This function codes for the damage taken to the player when the enemy collides with the zombie 
func check_collisions():
	if not damage_timer.is_stopped():
		return
	var collisions = $HurtBox.get_overlapping_bodies()
	if collisions:
		for collision in collisions:
			if collision. is_in_group("Player") and damage_timer.is_stopped():
				PlayerStats.damage_player(damage)


#This code uses the degrees that the enemy is in relative to the map, to determine which of the movement animations it plays
func check_animation(): 
	var angle = rad_to_deg(velocity.angle())
	if angle >-45 and angle < 45:
		sprite.play("left_right")
	if (angle >-180 and angle < -135) or (angle >135 and angle <180):
		sprite.play("left_right")
	if (angle> 45 and angle <135):
		sprite.play("down")
	if(angle> -135 and angle <-45):
		sprite.play("up")


#This makes the enemy to travel toward the player and also ensures that the enemy faces the right way
func _physics_process(delta):
	if dead:
		return
	var direction_to_player = global_position.direction_to(player.global_position) 
	velocity = direction_to_player * SPEED 
	
	if velocity.x > 0:
		sprite.flip_h = true 
	elif velocity.x < 0: 
		sprite.flip_h = false 
	
	move_and_slide()
	check_animation()


func take_damage(dmg):
	if dead:return
	health -= dmg
	#print("ouch")
	if health <= 0 :
		dead = true 
		GameManager.score += 1
		$AnimatedSprite2D.play("Damage-Up")
		await $AnimatedSprite2D.animation_finished
		#PlayerStats.enemy_killed()
		queue_free()


func _on_hurt_box_area_entered(area):
	if area.is_in_group("Bullet"):
		take_damage(5)
		area.queue_free()


func _on_hurt_box_body_entered(body):
	if body.is_in_group("Player"):
		#body.get_damage(10)
		print("hit body")
		PlayerStats.damage_player(damage)
		damage_timer.start()




func _on_area_2d_body_entered(body):
		if body.is_in_group("Player"):
			print("hit")
			#body.get_damage(10)
			PlayerStats.damage_player(damage)
			damage_timer.start()
