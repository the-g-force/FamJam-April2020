extends PathFollow2D

export var speed = 100

func _process(delta):
	offset += speed*delta
	if unit_offset > 1:
		queue_free()
