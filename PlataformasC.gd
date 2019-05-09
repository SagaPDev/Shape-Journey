extends Path2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 100

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	$PathFollow2D.offset += speed * delta
	$PathFollow2D2.offset += speed * delta
	$PathFollow2D3.offset += speed * delta
	$PathFollow2D4.offset += speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
