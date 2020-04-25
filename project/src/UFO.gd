extends Area2D

export var speed : float = 100
export var shoot_delay : float = 1
export var bullet_speed : float = 200

var _dead = false
var _target : Node2D
var _can_shoot : bool = true

const _EnemyBullet = preload("res://src/EnemyBullet.tscn")

onready var _explosion_sound = $Boom

func _on_body_entered(body):
	if body.is_in_group("Bullet"):
		if _dead == false:
			_explosion_sound.play()
			_dead = true
			body.queue_free()
			yield(get_tree().create_timer(0.5), "timeout")
			queue_free()


func _process(delta:float):
	if _target && _can_shoot:
		var bullet = _EnemyBullet.instance()
		bullet.position = get_global_transform().origin
		var trajectory : Vector2 = _target.get_global_transform().get_origin() - get_global_transform().origin
		bullet.velocity = trajectory.normalized() * bullet_speed
		get_parent().add_child(bullet)
		_can_shoot = false
		yield(get_tree().create_timer(shoot_delay), "timeout")
		_can_shoot = true


func _on_DetectionArea_body_entered(body):
	if body is Rocket:
		_target = body


func _on_DetectionArea_body_exited(body):
	if _target == body:
		_target = null
