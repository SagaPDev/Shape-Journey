extends Area2D


func _on_Nivel_Completado_body_entered(body):
	print(get_tree().current_scene.name)
	if (body.get_name() == "Jugador"):
		get_tree().paused = true
		yield(get_tree().create_timer(1), "timeout")
		get_tree().paused = false
		match(get_tree().current_scene.name):
			"Nivel I":
				get_tree().change_scene("Nivel II.tscn")
			"Nivel II":
				get_tree().change_scene("Nivel III.tscn")
			"Nivel III":
				get_tree().change_scene("Nivel IV.tscn")
			"Nivel IV":
				get_tree().change_scene("Nivel V.tscn")
			"Nivel V":
				get_node("../HUD/AnimationFade").play("fade")
				pass
				#play animation fade in
#				get_tree().change_scene("Nivel VI.tscn")
#			"Nivel VI":
#				get_tree().change_scene("Nivel VII.tscn")
#			"Nivel VII":
#				get_tree().change_scene("Nivel VIII.tscn")
#			"Nivel VIII":
#				get_tree().change_scene("Nivel IX.tscn")
#			"Nivel IX":
#				get_tree().change_scene("Nivel X.tscn")