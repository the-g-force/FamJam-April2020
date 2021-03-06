extends Area2D

export var speed : float = 100
export var shoot_delay : float = 1.5
export var bullet_speed : float = 200
export var shoot_variance : float = 0.3
# Accurance range in Radians
export var accuracy_variance : float = 0.5

var _dead = false
var _target : Node2D
var _can_shoot : bool = true

const _EnemyBullet = preload("res://src/EnemyBullet.tscn")
const _Explosion = preload("res://src/Explosion.tscn")
const _Chicken = preload("res://src/Chicken.tscn")

func _on_body_entered(body):
	if body.is_in_group("Bullet"):
		if _dead == false:
			_spawn(_Chicken)
			_spawn(_Explosion)
			_dead = true
			body.queue_free()
			queue_free()
			

func _spawn(scene : PackedScene) -> void:
	var node = scene.instance()
	node.position = get_global_transform().origin
	get_tree().get_root().call_deferred('add_child', node)


func _process(_delta:float):
	if _target and _can_shoot and not _dead:
		var bullet = _EnemyBullet.instance()

		# Determine the trajectory of the bullet
		var trajectory : Vector2 = _target.get_global_transform().get_origin() - get_global_transform().origin
		trajectory = trajectory.rotated(rand_range(-accuracy_variance, accuracy_variance))
		
		# Confugure the bullet and add it to the screen
		bullet.position = get_global_transform().origin
		bullet.forward_vector = trajectory.normalized()
		get_tree().get_root().add_child(bullet)
		$ShootSound.play()
		_can_shoot = false
		$ShootingCooldown.start(shoot_delay + rand_range(-shoot_variance, shoot_variance))


func _on_DetectionArea_body_entered(body):
	if body is Rocket:
		_target = body


func _on_DetectionArea_body_exited(body):
	if _target == body:
		_target = null


func _on_ShootingCooldown_timeout():
	_can_shoot = true
