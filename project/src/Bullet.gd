extends KinematicBody2D

export var velocity : Vector2

func _process(delta: float):
	var collision :KinematicCollision2D = move_and_collide(velocity*delta)
	if collision:
		var collider : Node2D = collision.collider as Node2D
		if collider.is_in_group("LevelBounds"):
			queue_free()
	


func _draw():
	draw_circle(Vector2.ZERO, $CollisionShape2D.shape.radius, Color.yellow)


