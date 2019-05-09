extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 100

var muerto = false
var motion = Vector2()
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var direction = left

signal game_over
func _ready():
    connect("game_over", $"../Jugador", "_on_gameover")


func _on_EnemyArea2D_body_entered(body):
	if (body.get_name() == "Jugador"):
		if get_node("../Jugador").ground_pound == true:
			$Sprite.play("muerto")
			muerto = true;
			#$Sprite.visible = false
		else:
			#get_tree().reload_current_scene()
			emit_signal("game_over")
			
			#$"../Jugador".position = $"../Start_Position".position
func _physics_process(delta):
	motion.y += GRAVITY
	motion.x = direction.x * SPEED
	motion = move_and_slide(motion, UP)
	if is_on_wall():
		if direction == left:
			direction = right
		elif direction == right:
			direction = left
	if $RayCast2DLeft.is_colliding() ==false:
			direction = right
	if $RayCast2DRight.is_colliding() ==false:
			direction = left
	if muerto == true:
		$CollisionShape2D.disabled = true
		$EnemyArea2D.monitoring = false
		pass # Replace with function body.