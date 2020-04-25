extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Rotation speed in degrees per second
export var rotation_speed : float = 60

# Max thrust strength in pixels per second
export var thrust_strength : float = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	# Turn according to the rotation inputs
	rotation_degrees += \
			(-Input.get_action_strength("TurnLeft") + Input.get_action_strength("TurnRight")) \
			* rotation_speed \
			* delta
	
	# Move forward according to current thrust
	var velocity = Vector2(0, -thrust_strength * Input.get_action_strength("Thrust"))\
			.rotated(deg2rad(rotation_degrees)) * delta
	position += velocity
	
