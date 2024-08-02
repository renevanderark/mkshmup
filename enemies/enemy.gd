class_name Enemy
extends Area2D

@export var hp : int = 100

var _start_pos : Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	if hp <= 0:
		_explode()
	if $Path2D/PathFollow2D.progress_ratio < .99:
		$Path2D/PathFollow2D.progress_ratio += 0.01

	position = _start_pos + $Path2D/PathFollow2D.position


func _explode():
	queue_free()


func _ready() -> void:
	_start_pos = position
