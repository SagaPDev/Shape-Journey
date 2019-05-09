extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
signal game_over
func _ready():
    connect("game_over", $"../../../Jugador", "_on_gameover")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KinematicBody2D_body_entered(body):
	if (body.get_name() == "Jugador"):
		#get_tree().reload_current_scene()
		emit_signal("game_over")