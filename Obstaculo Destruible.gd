extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var rota = false

func _on_Area2D_body_entered(body):
	if (body.get_name() == "Jugador") and get_parent().get_node("Jugador").ground_pound == true:
		$Sprite.visible = false
		rota = true
func _physics_process(delta):
	if rota == true:
		$Tabla.disabled = true