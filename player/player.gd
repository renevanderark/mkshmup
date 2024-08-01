class_name Player
extends Area2D

const MAX_X : float = 500
const MAX_Y : float = 1000

@export var speed : int = 200

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_pressed("speed_up"):
		speed = 400
	else:
		speed = 200
	#elif Input.is_key_pressed(KEY_LEFT):
		#velocity.x = -200
	#else:
		#velocity.x = 0
	#if

func _physics_process(delta: float) -> void:
	position += Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * delta * speed
	position.x = 0.0 if position.x < 0.0 else position.x
	position.x = MAX_X if position.x > MAX_X else position.x
	position.y = 0.0 if position.y < 0.0 else position.y
	position.y = MAX_Y if position.y > MAX_Y else position.y


func receive_powerup(type : PowerUp.PowerupType, amount : int):
	match type:
		PowerUp.PowerupType.BULLET_SPEED:
			for bs : BulletSpawner in find_children("*", "BulletSpawner"):
				# FIXME/TODO: change into a boost (so it can be temprorary)
				bs.bullet_speed += amount
		PowerUp.PowerupType.BULLET_FREQUENCY:
			for bs : BulletSpawner in find_children("*", "BulletSpawner"):
				# FIXME/TODO: change into a boost (so it can be temprorary)
				bs.spawn_frame_frequency -= amount
		PowerUp.PowerupType.BULLET_ADD:
			for bs : BulletSpawner in find_children("*", "BulletSpawner"):
				# FIXME/TODO: change into a boost (so it can be temprorary)
				if bs.unlock_level == amount:
					bs.disabled = false
