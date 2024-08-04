class_name Enemy
extends Area2D

@export_range(50, 2500) var speed : int = 150
@export var hp : int = 100
@export var loop_path : bool = false
var _start_pos : Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if hp <= 0:
		_explode()
	if $Path2D/PathFollow2D.progress_ratio < .99:
		$Path2D/PathFollow2D.progress += speed * delta
	elif loop_path:
		$Path2D/PathFollow2D.progress_ratio = 0
	position = _start_pos + $Path2D/PathFollow2D.position


func _explode():
	for powerup : PowerUp in find_children("*", "PowerUp"):
		powerup.reparent(get_tree().root)
		powerup.position = position + Vector2(randf_range(-50, 50), -10 + randf_range(-50, 50))
		powerup.show()
	queue_free()


func _ready() -> void:
	add_to_group("enemies")
	_start_pos = position
	for powerup : PowerUp in find_children("*", "PowerUp"):
		powerup.hide()
