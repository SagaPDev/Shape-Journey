extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var abierta = false
# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Knock_door(body):
	if (body.get_name() == "Jugador") and get_node("../Jugador").hold_key == true:
		abierta = true
		get_node("../Jugador/llave").visible == false
		get_node("../Jugador").hold_key == false
		pass # Replace with function body.
func _physics_process(delta):
	if abierta == true:
		get_node("../Jugador/llave").visible = false
		get_node("../Jugador").hold_key = false
		$CollisionShape2D.disabled = true
		$Sprite.visible = false