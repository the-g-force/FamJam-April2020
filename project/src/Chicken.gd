extends Area2D

var _rotation_speed : float 

onready var _sprite = $CollisionShape2D/Sprite

func _ready():
	randomize()
	_rotation_speed = rand_range(-2, 2)
	_sprite.scale *= Vector2(-1,1) if (randi() % 2 == 0) else Vector2(1,1)
	

func _process(delta:float):
	rotation = rotation + _rotation_speed * delta


func _on_Chicken_body_entered(body):
	if body is Rocket:
		$CluckSound.play()
		PlayerStats.score += 1
		hide()


func _on_CluckSound_finished():
	queue_free()
