extends KinematicBody2D
class_name Rocket


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Rotation speed in degrees per second
export var rotation_speed : float = 60

export var acceleration : float = 0.1

export var min_speed : float = 20
export var max_speed : float = 150
export var Bullet = preload("res://src/Bullet.tscn")
export var bullet_speed : float = 400

var _speed : float = 0
var health = 10

onready var _flames : Node2D = $Hull/Flames
onready var _gunpoint : Node2D = $GunPoint
onready var _shoot_sound : AudioStreamPlayer2D = $ShootSound
onready var _thrust_sound = $ThrustSound

func _process(delta):
	# Turn according to the rotation inputs
	rotation_degrees += \
			(-Input.get_action_strength("TurnLeft") + Input.get_action_strength("TurnRight")) \
			* rotation_speed \
			* delta
			
	# Play thrust sound as needed
	if Input.get_action_strength("Thrust") != 0:
		if _thrust_sound.playing == false:
			_thrust_sound.play()
	else:
		_thrust_sound.stop()
		
	# Determine the speed based on acceleration
	var target_speed = lerp(min_speed, max_speed, Input.get_action_strength("Thrust"))
	_speed = lerp(_speed, target_speed, acceleration)
	
	# Move the rocket
	var velocity : Vector2 = Vector2(0, -_speed).rotated(deg2rad(rotation_degrees)) * delta
	var _collision = move_and_collide(velocity) # Ignore the collision results for now

	# Update the flame visibility
	_flames.visible = Input.get_action_strength("Thrust") > 0

	# Fire!
	if Input.is_action_just_pressed("Fire"):
		var bullet = Bullet.instance()
		bullet.velocity = Vector2(0,-bullet_speed).rotated(rotation)
		bullet.position = $GunPoint.get_global_transform().get_origin()
		get_parent().add_child(bullet)
		_shoot_sound.play()

func damage():
	health -= 1
	if health <= 0:
		hide()
