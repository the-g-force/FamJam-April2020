extends CanvasLayer

onready var healthtracker = $Label

func _process(delta):
	healthtracker.text = str(PlayerStats.health)
