extends CharacterBody2D  # Tank is a CharacterBody2D

# Variables for movement and rotation
var is_rotating = true
var move_speed = 75
var rotation_speed = 4
var health = 100
var health_max = 100
var health_min = 0
var ammo = 3
var bullet_speed = 200
@onready var gun = $Marker2D

@onready var bullet = preload("res://bullet.tscn")
func _physics_process(delta):
	# Check for 'ui_accept' (space) button input
	if Input.is_action_just_pressed("r"):
		fire()
		is_rotating = false  # Stop rotation
		velocity = Vector2.ZERO  # Ensure the tank stays stationary
	elif Input.is_action_pressed("r"):
		is_rotating = false  # Stop rotation
		move_forward(delta)  # Move forward without rotation
	else:
		# Rotate continuously if no button is pressed
		is_rotating = true
		velocity = Vector2.ZERO  # Ensure no motion when stationary

	# Apply rotation if allowed
	if is_rotating:
		rotate_tank(delta)

	# Apply movement
	move_and_slide()

func rotate_tank(delta):
	rotation += rotation_speed * delta

func move_forward(delta):
	var direction = Vector2(cos(rotation), sin(rotation)).normalized()
	velocity = direction * move_speed

func take_damage():
	health -= 10
	
func fire():
	if ammo > 0:
		var bullet_instance = bullet.instantiate()
		bullet_instance.direction = rotation
		bullet_instance.spawnPos = gun.global_position
		bullet_instance.spawnRot = rotation
		get_parent().add_child(bullet_instance)
