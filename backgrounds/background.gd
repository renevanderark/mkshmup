extends Node2D


@export_range(10, 500) var speed : int = 150


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y >= 1000:
		position.y -= 1000
