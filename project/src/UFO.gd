extends PathFollow2D

export var speed = 100
var dead = false
onready var explosion = $Boom

func _process(delta):
	if dead == false:
		offset += speed*delta
		if unit_offset > 1:
			queue_free()

func _on_body_entered(body):
	if body.is_in_group("Bullet"):
		if dead == false:
			explosion.play()
			dead = true
			body.queue_free()
			yield(get_tree().create_timer(0.5), "timeout")
			queue_free()
