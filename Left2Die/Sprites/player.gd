extends CharacterBody2D


@export var SPEED = 300.0
@export var ACCELERATION = 20 
@export var FRICTION = 10.0
@onready var sprite = $Sprite
const BULLET = preload("res://Scenes/Bullet.tscn")
func check_animation():
	if velocity == Vector2.ZERO:
		sprite.play("Idle")
	elif velocity.x != 0:
		sprite.play("Running")
	if Input.is_action_pressed("shoot"):
		sprite.play("Shooting")
	
 

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left","right","up","down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	if velocity.x > 0: 
		sprite.flip_h = false 
	elif velocity.x < 0: 
		sprite.flip_h = true 

	if Input.is_action_just_pressed("shoot"):
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = global_position
		new_bullet.look_at(get_global_mouse_position())
		add_sibling(new_bullet)
		

		
			

	check_animation()
	move_and_slide()









