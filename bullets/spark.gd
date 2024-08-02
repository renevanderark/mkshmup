extends Sprite2D

var lifetime = 0

func _process(_delta: float) -> void:
	lifetime += 1
	if lifetime == 4:
		queue_free()
