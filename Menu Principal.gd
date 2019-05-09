extends Control
func _ready():
	$Control/VBoxContainer/HBoxContainer/BotonJugar.grab_focus()
	pass
func _on_BotonJugar_pressed():
	get_tree().change_scene("Nivel I.tscn")
	pass # Replace with function body.


func _on_BotonSalir_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_ButtonInstrucciones_pressed():
	$ControlInstrucciones.visible = true
	$ControlInstrucciones.mouse_filter = Control.MOUSE_FILTER_STOP
	pass # Replace with function body.


func _on_Atras_pressed():
	$ControlInstrucciones.visible = false
	$ControlInstrucciones.mouse_filter = Control.MOUSE_FILTER_PASS
	pass # Replace with function body.


func _on_CheckButton_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass # Replace with function body.
