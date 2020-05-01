extends KinematicBody2D
class_name Rocket

# Rotation speed in degrees per second
export var rotation_speed : float = 60

export var acceleration : float = 0.1

export var min_speed : float = 20
export var max_speed : float = 150
export var Bullet = preload("res://src/Bullet.tscn")
export var bullet_speed : float = 400
export var shield_recharge_time : float = 4

onready var _flames : Node2D = $Hull/Flames
onready var _shield_up : AudioStreamPlayer = $ShieldUp
onready var _shield_down : AudioStreamPlayer = $ShieldDown
onready var _collision : CollisionShape2D = $CollisionShape2D
onready var _gunpoint : Node2D = $GunPoint
onready var _shield : Sprite = $Shield
onready var _shoot_sound : AudioStreamPlayer2D = $ShootSound
onready var _thrust_sound = $ThrustSound
onready var _damage_sound = $DamageSound

var _speed : float = 0
var _dead : bool = false
var _shielding : bool = true

const _explosion = preload("res://src/Explosion.tscn")
const _end = preload("res://src/End.tscn")

func _process(delta):
	if not _dead:
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
			bullet.forward_vector = Vector2(0,-1).rotated(rotation)
			bullet.position = $GunPoint.get_global_transform().get_origin()
			get_parent().add_child(bullet)
			_shoot_sound.play()
		
		# DIE
		if Input.is_action_just_pressed("die"):
			PlayerStats.health = 0
			damage()
			

func damage():
	if not _shielding:
		PlayerStats.health -= 1
		_damage_sound.play()
	else:
		_shield_down.play()
		_shielding = false
		_shield.visible = false
		$ShieldTimer.start(shield_recharge_time)
	if PlayerStats.health <= 0:
		if not _dead:
			var _explode = _explosion.instance()
			_explode.position = get_global_transform().origin
			get_tree().get_root().call_deferred('add_child', _explode)
			hide()
			_collision.disabled = true
			_dead = true
			yield(get_tree().create_timer(2), "timeout")
			var _error = get_tree().change_scene_to(_end)


func _on_ShieldTimer_timeout():
	_shield_up.play()
	_shielding = true
	_shield.visible = true
