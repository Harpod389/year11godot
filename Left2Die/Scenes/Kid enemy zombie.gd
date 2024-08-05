extends CharacterBody2D
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("Player")
@export var health = 10 


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
	var direction_to_player = global_position.direction_to(player.global_position) 
	velocity = direction_to_player * SPEED  
	
	
	
	if velocity.x > 0:
		animated_sprite_2d.flip_h = true 
	elif velocity.x < 0: 
		animated_sprite_2d.flip_h = false 
	move_and_slide()
	check_animation()

func take_damage(dmg):
	health -= dmg
	if health <= 0 :
		
		queue_free()
		
func _on_hurt_box_area_entered(area):
	if area.is_in_group("Bullet"):
		take_damage(5)
		area.queue_free()
		








#func _on_hurt_box_area_entered(area):
	#if area.is_in_group("Bullet"):
		#queue_free()
		#area.queue_free()

