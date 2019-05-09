extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Key_grab(body):
	if (body.get_name() == "Jugador"):
		get_node("../Jugador").hold_key = true
		$Sprite.visible = false
		pass # Replace with function body.
