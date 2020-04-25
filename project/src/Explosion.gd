extends Node2D

export var pause_before_removal : float = 0.5

onready var _explosion_sound : AudioStreamPlayer2D = $Sound

func _ready():
	$AnimatedSprite.play()


func _on_AnimatedSprite_animation_finished():
	print('finished')
	# Wait a moment before killing this explosion.
	yield(get_tree().create_timer(pause_before_removal), "timeout")
	queue_free()
