extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
	
func _physics_process(delta):
	get_tree().create_timer(6.0).connect("timeout",self,"_on_timer_timeot")
	Node2D.connect("timeout",self,on_timer_timeot)
	signal 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
