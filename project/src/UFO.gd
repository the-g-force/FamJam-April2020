extends Area2D

export var speed : float = 100
export var shoot_delay : float = 1
export var bullet_speed : float = 200

var _dead = false
var _target : Node2D
var _can_shoot : bool = true

const _EnemyBullet = preload("res://src/EnemyBullet.tscn")
const _Explosion = preload("res://src/Explosion.tscn")

func _on_body_entered(body):
	if body.is_in_group("Bullet"):
		if _dead == false:
			_spawn_explosion()
			_dead = true
			body.queue_free()
			queue_free()
			

func _spawn_explosion() -> void:
	var explosion = _Explosion.instance()
	explosion.position = position
	get_parent().add_child(explosion)


func _process(_delta:float):
	if _target and _can_shoot and not _dead:
		var bullet = _EnemyBullet.instance()
		bullet.position = get_global_transform().origin
		var trajectory : Vector2 = _target.get_global_transform().get_origin() - get_global_transform().origin
		bullet.velocity = trajectory.normalized() * bullet_speed
		get_parent().add_child(bullet)
		_can_shoot = false
		$ShootingCooldown.start(shoot_delay)


func _on_DetectionArea_body_entered(body):
	if body is Rocket:
		_target = body


func _on_DetectionArea_body_exited(body):
	if _target == body:
		_target = null


func _on_ShootingCooldown_timeout():
	_can_shoot = true
