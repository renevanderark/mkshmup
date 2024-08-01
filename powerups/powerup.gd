class_name PowerUp
extends Area2D

enum PowerupType {
	BULLET_SPEED, BULLET_FREQUENCY, BULLET_ADD
}

@export var powerup_type : PowerupType = PowerupType.BULLET_FREQUENCY
@export var boost_amount : int = 1

var _picked_up = false

func _on_area_entered(area: Area2D) -> void:
	if not _picked_up:
		_picked_up = true
		queue_free()
		if area.is_in_group("player"):
			(area as Player).receive_powerup(powerup_type, boost_amount)
