extends Panel

@export 
var current_wave = 1

func _ready() -> void:
	_start_next_wave(true)


func _start_next_wave(initial_wave := false):
	if not initial_wave:
		current_wave += 1
	for enemy : Enemy in get_tree().get_nodes_in_group("enemies"):
		enemy.start_if_in_wave(current_wave)
	
	if _get_enemies_incurrent_wave().is_empty():
		await get_tree().create_timer(10).timeout
		get_tree().quit()

func _get_enemies_incurrent_wave():
	return get_tree().get_nodes_in_group("enemies").filter(func(enemy : Enemy): return enemy.wave_number == current_wave)


func _process(_delta: float) -> void:
	var bs_info = "\n"
	for bs : BulletSpawner in $Player.find_children("*", "BulletSpawner"):
		if not bs.disabled:
			bs_info += "    " + bs.str_info() + "\n"

	if _get_enemies_incurrent_wave().is_empty():
		_start_next_wave()

	$Label.text = (
		"""Player HP: %d
		FPS: %d
		Enemies: %d
		current_wave: %d
		BulletSpawners: %s
		Bullets Active: %s
		""" % [
			$Player.hp,
			Engine.get_frames_per_second(),
			_get_enemies_incurrent_wave().size(),
			current_wave,
			bs_info,
			str(get_tree().get_nodes_in_group("bullets").size())
		]
	)
