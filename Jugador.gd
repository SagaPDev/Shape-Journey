extends KinematicBody2D
var forma = "cuadrado"
var saltos = 2
var ground_pound = false
const ACELERACION = 50
export (int) var MAX_SPEED = 200
export (int) var GRAVITY = 20
export (int) var JUMP_HEIGHT = 400

var motion = Vector2()
var UP = Vector2(0,-1)
func _physics_process(delta):
	var friction = false
	#Swap
	# TRIANGULO
	if Input.is_action_just_pressed("ui_select"):
		#GRAVITY = 10
		forma = "triangulo"
		#visile
		get_node("SpriteTriangulo").visible = true
		get_node("SpriteCuadrado").visible = false
		get_node("SpriteCirculo").visible = false
		#colicion
		get_node("ColisionTriangulo").disabled = false
		get_node("ColisionCuadrado").disabled = true
		get_node("ColisionCirculo").disabled = true
		
	# CUADRADO
	if Input.is_action_just_pressed("ui_options"):
		#GRAVITY = 10
		forma = "cuadrado"
		get_node("SpriteCirculo").visible = false
		get_node("SpriteCuadrado").visible = true
		get_node("SpriteTriangulo").visible = false
		#colision
		get_node("ColisionTriangulo").disabled = true
		get_node("ColisionCuadrado").disabled = false
		get_node("ColisionCirculo").disabled = true
		
		#Ground Pound v1
		if !is_on_floor():
			motion.y = 600
			motion.x = 0
			ground_pound = true
		
	# CIRCULO
	if Input.is_action_just_pressed("ui_cancel"):
		#GRAVITY = 7
		forma = "circulo"
		get_node("SpriteCirculo").visible = true
		get_node("SpriteCuadrado").visible = false
		get_node("SpriteTriangulo").visible = false
		#colision
		get_node("ColisionTriangulo").disabled = true
		get_node("ColisionCuadrado").disabled = true
		get_node("ColisionCirculo").disabled = false
	
	#movimiento
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		if ground_pound == false:
			motion.x = min(motion.x+ACELERACION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		if ground_pound == false:
			motion.x =  max(motion.x-ACELERACION, -MAX_SPEED)
	else:
		friction = true
		
		
		
	#SALTAR
	if is_on_floor():
		ground_pound = false
		saltos = 2
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = -JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x , 0 , 0.2)
	else:
		if friction == true:
			motion.x = lerp(motion.x , 0 , 0.5)
			
			
			
	# salto doble	
	if forma == "circulo" and Input.is_action_just_pressed("ui_accept") and saltos > 0:
		motion.y = -JUMP_HEIGHT
		saltos = saltos -1
	
	
	
	# FALL
	# Ground Pound v1
			#motion.y = 600
		# YO CREO QUE ESTO SEPUEDE RESOLVER CONUN IF
	#DEBUG OPTONS
	print (motion)
	var isOnFloor = is_on_floor()
	#print(isOnFloor)
	#arriba
	motion = move_and_slide(motion,UP)