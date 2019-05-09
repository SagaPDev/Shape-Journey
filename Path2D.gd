extends Path2D

var speed = 100

#func _ready():
    #set_physics_process(true)
   # $PathFollow2D.offset = 200  # Change the initial offset.

func _physics_process(delta):
    # Change the offset or unit_offset to move the PathFollow and its children.
	$PathFollow2D.offset += speed * delta