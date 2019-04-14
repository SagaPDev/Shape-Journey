extends Control


func _on_BotonJugar_pressed():
	get_tree().change_scene("Nivel 1.tscn")
	pass # Replace with function body.


func _on_BotonSalir_pressed():
	get_tree().quit()
	pass # Replace with function body.
