extends CharacterBody2D
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("Player")
@export var health = 10 
@onready var HurtBox  = $HurtBox
var dead = false








func check_animation(): 
	var angle = rad_to_deg(velocity.angle())
	if angle >-45 and angle < 45:
		animated_sprite_2d.play("Left_Right")
	if (angle >-180 and angle < -135) or (angle >135 and angle <180):
		animated_sprite_2d.play("Left_Right")
	if (angle> 45 and angle <135):
		animated_sprite_2d.play("Down")
	if(angle> -135 and angle <-45):
		animated_sprite_2d.play("Up")


func _physics_process(delta):
	if dead :
		
		return
	var direction_to_player = global_position.direction_to(player.global_position) 
	velocity = direction_to_player * SPEED  
	
	
	
	if velocity.x > 0:
		animated_sprite_2d.flip_h = true 
	elif velocity.x < 0: 
		animated_sprite_2d.flip_h = false 
	move_and_slide()
	check_animation()




func take_damage(dmg):
	if dead:return
	health -= dmg
	#print("ouch")
	if health <= 0 :
		dead = true 
		GameManager.score += 1
		$AnimatedSprite2D.play("Damagedup")
		await $AnimatedSprite2D.animation_finished
		PlayerStats.enemy_killed()
		queue_free()






func _on_hurt_box_area_entered(area):
	if area.is_in_group("Bullet"):
		take_damage(5)
		area.queue_free()
		





#func _on_hurt_box_area_entered(area):
	#if area.is_in_group("Bullet"):
		#queue_free()
		#area.queue_free()



func _on_hurt_box_body_entered(body):
	if 'get_damage' in body:
		body.get_damage(10)


func _on_area_2d_body_entered(body):
		if 'get_damage' in body:
			body.get_damage(10)
