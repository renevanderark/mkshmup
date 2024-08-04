class_name EnemyBullet
extends Bullet

func _on_area_entered(area: Area2D) -> void:
	if not _dealt_damage and area.is_in_group("player_core"):
		_dealt_damage = true
		(area.get_parent() as Player).hp -= 1
		queue_free()
