extends Node2D

func _on_Nivel_Completado_body_entered(body):
	if (body.get_name() == "Jugador"):
		print("HI")
		get_tree().change_scene("Nivel_de_prueba.tscn")
		
		
func _on_Caida_body_entered(body):
	if (body.get_name() == "Jugador"):
		get_tree().change_scene("Nivel 1.tscn")
		print("se callo")
		
	
func _on_Peligro2_body_entered(body):
	if (body.get_name() == "Jugador"):
		get_tree().change_scene("Nivel 1.tscn")