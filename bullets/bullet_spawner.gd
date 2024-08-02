class_name BulletSpawner
extends Node2D

const MAX_FRAME_COUNT = 120
@export var BulletScene : PackedScene = null
@export_range(1, MAX_FRAME_COUNT) var spawn_frame_frequency : int = 4
@export_range(50, 5000) var bullet_speed = 500
@export var disabled : bool = false
@export var unlock_level : int = 0

var _frame_count : int = 0

func _process(_delta: float) -> void:
	_frame_count = _frame_count + 1 if _frame_count < MAX_FRAME_COUNT else 0

	if not disabled and (_frame_count + 1) % spawn_frame_frequency == 0 and BulletScene:
		_spawn_bullet()


func _spawn_bullet():
	var new_bullet : Bullet = BulletScene.instantiate()
	new_bullet.position = global_position
	new_bullet.rotation = rotation
	new_bullet.speed = bullet_speed
	get_tree().root.call_deferred("add_child", new_bullet)


func str_info() -> String:
	return name + "(spd=" + str(bullet_speed) + " | freq=" + str(spawn_frame_frequency) + ")"
