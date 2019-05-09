extends KinematicBody2D

var forma = "cuadrado"
var saltos = 2
var ground_pound = false
var puas = false
var hold_key = false

const ACELERACION = 50
const MAX_SPEED = 200
const GRAVITY = 20
const JUMP_HEIGHT = 400

var motion = Vector2()
var UP = Vector2(0,-1)

var vivo
#
#if Input.is("ui_start"):
func _ready():
	vivo = true
	pass

func _on_gameover():
	vivo = false
	if forma == "cuadrado":
		$AnimatedSprite.play("cuadrado muerto")
	if forma == "circulo":
		$AnimatedSprite.play("circulo muerto")
	get_tree().paused = true
	yield(get_tree().create_timer(1), "timeout")
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass

func _physics_process(delta):
	var friction = false
	if hold_key == true:
		$llave.visible = true
	#Swap
	####################TRIANGULO####################
#	if Input.is_action_just_pressed("ui_select"):
#		#GRAVITY = 10
#		forma = "triangulo"
#		#visile
#		$AnimatedSprite.play("Triangulo")
#		#get_node("SpriteTriangulo").visible = true
#		#get_node("SpriteCirculo").visible = false
#		#colicion
#		get_node("ColisionTriangulo").disabled = false
#		get_node("ColisionCuadrado").disabled = true
#		get_node("ColisionCirculo").disabled = true
		
#	if forma == "triangulo" and Input.is_action_just_pressed("ui_shoulder"):
#		$AnimatedSprite.play("Puas")
#		puas = true
#	if Input.is_action_just_released("ui_shoulder"):
#		puas = false
#		$AnimatedSprite.play("Triangulo")
	############################CUADRADO################################
	if Input.is_action_just_pressed("ui_options"):
		#GRAVITY = 10
		forma = "cuadrado"
		$AnimatedSprite.play("Cuadrado")
		#get_node("SpriteCirculo").visible = false
		#get_node("SpriteCuadrado").visible = true
		#get_node("SpriteTriangulo").visible = false
		#colision
		#get_node("ColisionTriangulo").disabled = true
		get_node("ColisionCuadrado").disabled = false
		get_node("ColisionCirculo").disabled = true
		
		
		#Ground Pound v1
		if !is_on_floor():
			motion.y = 1000
			motion.x = 0
			ground_pound = true
			
		#####grond pond animation###
	#if ground_pound == true:
		#get_node("Caida").visible = true
		#get_node("SpriteCuadrado").visible = false
	#else:
		#get_node("Caida").visible = false
		#get_node("SpriteCuadrado").visible = true
		
	########################CIRCULO################################
	if Input.is_action_just_pressed("ui_cancel"):
		#GRAVITY = 7
		forma = "circulo"
		$AnimatedSprite.play("Circulo")
		#get_node("SpriteCirculo").visible = true
		#get_node("SpriteCuadrado").visible = false
		#get_node("SpriteTriangulo").visible = false
		#colision
		#get_node("ColisionTriangulo").disabled = true
		get_node("ColisionCuadrado").disabled = true
		get_node("ColisionCirculo").disabled = false
	########################movimiento######################
	#gravedad
	motion.y += GRAVITY
	
	#ground pound LOkC
	if Input.is_action_pressed("ui_right") and ground_pound ==false:
		motion.x = min(motion.x+ACELERACION, MAX_SPEED)
		#$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left") and ground_pound == false:
		#$AnimatedSprite.flip_h = true
		motion.x =  max(motion.x-ACELERACION, -MAX_SPEED)
	else:
		friction = true
#		pass
		
		
	#SALTAR
	if is_on_floor():
#		puas = false
		#motion.y = 0
		if ground_pound == true:
			$AnimatedSprite.play("Ground_pound_hit")
			yield(get_tree().create_timer(0.1), "timeout")
			$AnimatedSprite.play("Cuadrado")
			ground_pound = false
		saltos = 2
		if Input.is_action_just_pressed("ui_accept") and ground_pound == false:
			motion.y = min(-JUMP_HEIGHT, -400)
#			if forma == "triangulo" and Input.is_action_just_pressed("ui_shoulder"):
#				puas = true
#			if forma == "trianglo" and Input.is_action_just_released("ui_shoulder"):
#				puas = false




		if friction == true:
			motion.x = lerp(motion.x , 0 , 0.2)
#	else:
#		if friction == true:
#			motion.x = lerp(motion.x , 0 , 0.5)
			
			
			
			
	# salto doble	
	if forma == "circulo" and Input.is_action_just_pressed("ui_accept") and saltos > 0:
		motion.y = -JUMP_HEIGHT
		saltos = saltos -1
	
	motion = move_and_slide(motion,UP)
	
	
	
	
	if puas == true:
		$AnimatedSprite.play("Puas")
	
	# FALL
	# Ground Pound v1
			#motion.y = 600
		# YO CREO QUE ESTO SEPUEDE RESOLVER CONUN IF
		
		
		
	#DEBUG OPTONS
	#reset
#	if Input.is_action_pressed("ui_home"):
#		get_tree().reload_current_scene()
#		#print("estas loco")
#		#position = Vector2( 0 , 0 )
	var p
	p = position
	#var isOnFloor = is_on_floor()
	#print(motion)
	#arriba






