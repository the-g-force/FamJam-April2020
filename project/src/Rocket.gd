extends KinematicBody2D

onready var engine = $AudioStreamPlayer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Rotation speed in degrees per second
export var rotation_speed : float = 60

export var acceleration : float = 0.1

export var min_speed : float = 20
export var max_speed : float = 150

var _speed : float = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	# Turn according to the rotation inputs
	rotation_degrees += \
			(-Input.get_action_strength("TurnLeft") + Input.get_action_strength("TurnRight")) \
			* rotation_speed \
			* delta
	if Input.get_action_strength("Thrust") != 0:
		if engine.playing == false:
			engine.play()
	else:
		engine.stop()
	# Determine the speed based on acceleration
	var target_speed = lerp(min_speed, max_speed, Input.get_action_strength("Thrust"))
	_speed = lerp(_speed, target_speed, acceleration)
	
	# Move the rocket
	var velocity : Vector2 = Vector2(0, -_speed).rotated(deg2rad(rotation_degrees)) * delta
	move_and_collide(velocity)
