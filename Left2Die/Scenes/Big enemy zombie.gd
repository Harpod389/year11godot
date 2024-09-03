extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var sprite = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("Player")


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



func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position) 
	velocity = direction_to_player * SPEED 
	
	if velocity.x > 0:
		sprite.flip_h = true 
	elif velocity.x < 0: 
		sprite.flip_h = false 
	
	move_and_slide()
	check_animation()
