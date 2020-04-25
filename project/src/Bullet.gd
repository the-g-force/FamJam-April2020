extends KinematicBody2D


export var forward_vector : Vector2 = Vector2(1,0) setget _set_forward_vector
export var speed : float = 400

func _process(delta: float):
	var velocity = forward_vector * speed * delta
	var collision :KinematicCollision2D = move_and_collide(velocity)
	if collision:
		var collider : Node2D = collision.collider as Node2D
		if collider.is_in_group("LevelBounds"):
			queue_free()


func _set_forward_vector(value:Vector2) -> void:
	forward_vector = value.normalized()
	rotation = forward_vector.angle()
