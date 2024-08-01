class_name Bullet
extends StaticBody2D

var speed : int = 500


func _physics_process(delta: float) -> void:
	position += Vector2.UP.rotated(rotation) * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _ready() -> void:
	add_to_group("bullets")
