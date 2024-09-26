extends CharacterBody2D



@export var health = 100.0
@export var SPEED = 100
@export var ACCELERATION = 15 
@export var FRICTION = 10.0
@onready var sprite = $Sprite
@onready var gunshots = $Gunshots
@onready var collision_shape = $HurtBox
const DAMAGE_RATE = 5.0
var died = false


const BULLET = preload("res://Scenes/Bullet.tscn")
#This function ensures that the appropriate player animation plays when the player is standing still, idle, running etc
func check_animation():
	if velocity == Vector2.ZERO:
		sprite.play("Idle")
	elif velocity.x != 0:
		sprite.play("Running")
	if Input.is_action_pressed("shoot"):
		sprite.play("Shooting")
	
#This function makes sure that the PLayer's apropriate animation plays, and also makes sure that the UI updates
func get_damage(amount):
	if died:
		return
	health -= amount
	$UI/Control/Health.value = health
	print(health)
	$Sprite.play("Damage")
	if health <= 0:
		print("i died")
		$Sprite.play("Death")
		died = true
		await $Sprite.animation_finished
		get_tree().reload_current_scene()
		
#check_animation()





#This function controls the players basic movement, and their correct orientation
func _physics_process(delta):
	if died == false:
		var direction = Input.get_vector("left","right","up","down").normalized()
		if direction:
			velocity = velocity.move_toward(direction * PlayerStats.SPEED, ACCELERATION)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
			if velocity.x > 0: 
						sprite.flip_h = false 
			elif velocity.x < 0: 
						sprite.flip_h = true 


#This function makes sure that bullet apears and also shoots at the players mouse direction when they right click. It also plays the sound effect after they shoot
		if Input.is_action_just_pressed("shoot"):
						var new_bullet = BULLET.instantiate()
						new_bullet.global_position = global_position
						new_bullet.look_at(get_global_mouse_position())
						add_sibling(new_bullet)
						gunshots.play()

		check_animation()
		move_and_slide()
