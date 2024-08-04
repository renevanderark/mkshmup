class_name Bullet
extends Area2D

const SparkScenes = [
	preload("res://bullets/spark_1.tscn"),
	preload("res://bullets/spark_2.tscn"),
	preload("res://bullets/spark_3.tscn")
]

var speed : int = 500
var damage = 1
var _dealt_damage = false

func _physics_process(delta: float) -> void:
	position += Vector2.UP.rotated(rotation) * speed * delta
	if not $VisibleOnScreenNotifier2D.is_on_screen():
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _ready() -> void:
	add_to_group("bullets")


func _on_area_entered(area: Area2D) -> void:
	if not _dealt_damage and area.is_in_group("enemies"):
		_dealt_damage = true
		(area as Enemy).hp -= 1
		var spark = SparkScenes[randi_range(0, 2)].instantiate()
		spark.position = position
		get_tree().root.call_deferred("add_child", spark)
		queue_free()
