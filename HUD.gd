extends CanvasLayer
var seconds = 0
var minutes = 0
func _process(delta):
	$"Interface/HBoxContainer/Level Name".text = get_tree().current_scene.name
	pass
	
	$Interface/HBoxContainer2/Minutes.text = str(minutes)
	$Interface/HBoxContainer2/Seconds.text = str(seconds)


func _on_Time_timeout():
	seconds += 1
	if seconds == 60:
		seconds = 0
		minutes += 1
	
	pass # Replace with function body.
