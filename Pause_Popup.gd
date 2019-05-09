extends CanvasLayer
var keysActive = false
var controllcount
func _physics_process(delta):
	if get_tree().paused == false:
		controllcount = 0
func _ready():
	#$Control/CenterContainer/VBoxContainer/HBoxContainer/ButtonContinuar.grab_focus()
	pass
	
func _input(event):
	
	if get_tree().paused == true:
		if controllcount == 0:
			$Control/CenterContainer/VBoxContainer/HBoxContainer/ButtonContinuar.grab_focus()
			controllcount += 1
#	pass
		
	if event.is_action_pressed("ui_start") and $"../Jugador".vivo==true:
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		$Control.visible = pause_state
		$ControlInstrucciones.visible = false
		$ControlInstrucciones.mouse_filter = Control.MOUSE_FILTER_PASS
		pass # Replace with function body.
#	if event.is_action_pressed("ui_cancel"):
#		$ControlInstrucciones.visible = false
#		$ControlInstrucciones.mouse_filter = Control.MOUSE_FILTER_PASS
#		pass # Replace with function body.

func _on_Button_pressed():
	var pause_state = not get_tree().paused
	get_tree().paused = pause_state
	$Control.visible = pause_state
	pass # Replace with function body.

func _on_Button2_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_CheckButton_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass # Replace with function body.


func _on_ButtonInstrucciones_pressed():
	$ControlInstrucciones.visible = true
	$ControlInstrucciones.mouse_filter = Control.MOUSE_FILTER_STOP
	pass # Replace with function body.

func _on_Atras_pressed():
	$ControlInstrucciones.visible = false
	$ControlInstrucciones.mouse_filter = Control.MOUSE_FILTER_PASS
	pass # Replace with function body.
	
