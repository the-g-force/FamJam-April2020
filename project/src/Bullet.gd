extends Area2D

export var velocity : Vector2

func _process(delta: float):
	position += velocity * delta


func _draw():
	draw_circle(Vector2.ZERO, $CollisionShape2D.shape.radius, Color.yellow)


func _on_Bullet_body_entered(body):
	
	if body.is_in_group("LevelBounds"):
		queue_free()

