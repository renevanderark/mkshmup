extends Panel


func _process(_delta: float) -> void:
	var bs_info = "\n"
	for bs : BulletSpawner in $Player.find_children("*", "BulletSpawner"):
		if not bs.disabled:
			bs_info += "    " + bs.str_info() + "\n"

	$Label.text = (
		"""Player HP: %s
		FPS: %s
		BulletSpawners: %s
		Bullets Active: %s
		""" % [
			str($Player.hp),
			str(Engine.get_frames_per_second()),
			bs_info,
			str(get_tree().get_nodes_in_group("bullets").size())
		]
	)
