extends Area2D

export var speed = 100

var _dead = false

onready var explosion = $Boom

func _on_body_entered(body):
	if body.is_in_group("Bullet"):
		if _dead == false:
			explosion.play()
			_dead = true
			body.queue_free()
			yield(get_tree().create_timer(0.5), "timeout")
			queue_free()
