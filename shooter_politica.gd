extends Node2D
var disparo = false
var fallosresp = 0
var win = true
var buenosresp = 0
var pregunta = 0
var pregunta1 = false
var pregunta2 = false
var pregunta3 =false
var pregunta4 = false
var pregunta5 = false
var sec=0
var Dsec=20
@onready var sailda = $Sailda
@onready var heart = $Area2D/heart
@onready var label = $Area2D/Label
@onready var mostrar_timer = $MostrarTimer

# Called when the node enters the scene tree for the first time.	
func _ready():
	timerReset()
	DialogueManager.show_dialogue_balloon(load("res://ahooterinicio2.dialogue"),"start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_Z):
		timerReset()
		pregunta = 1
		DialogueManager.show_dialogue_balloon(load("res://shooter1.dialogue"),"start")
		print("pregunta #: " +  str(pregunta))
	elif Input.is_key_pressed(KEY_C):
		timerReset()
		pregunta = 2
		DialogueManager.show_dialogue_balloon(load("res://shooter2.dialogue"), "start")
		print("pregunta #: " +  str(pregunta))
	elif Input.is_key_pressed(KEY_V):
		timerReset()
		pregunta = 3
		DialogueManager.show_dialogue_balloon(load("res://shooter3.dialogue"), "start")
		print("pregunta #: " +  str(pregunta))
	elif Input.is_key_pressed(KEY_B):
		timerReset()
		pregunta = 4
		DialogueManager.show_dialogue_balloon(load("res://shooter4.dialogue"), "start")
		print("pregunta #: " +  str(pregunta))
	elif Input.is_key_pressed(KEY_N):
		timerReset()
		pregunta = 5
		DialogueManager.show_dialogue_balloon(load("res://shooter5.dialogue"), "start")
		print("pregunta #: " +  str(pregunta))
	elif Input.is_key_pressed(KEY_A):
		fallosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
		print(fallosresp)
	elif Input.is_key_pressed(KEY_D):
		buenosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"), "start")
		print(buenosresp)
	if Input.is_key_pressed(KEY_Q):
		if disparo == false:
			Global.flechando=true
			disparo=true
			var flecha = $TileMap/Link/Arrow.duplicate()
			flecha.position = $TileMap/Link.position
			add_sibling(flecha)
			await get_tree().create_timer(0.5).timeout
			Global.flechando=false
			disparo=false
	#if(disparo==false):
		#if Input.is_key_pressed(KEY_Q):
			#await get_tree().create_timer(0.6).timeout
			#$Link/flecha.position = Vector2(-4,-20)
			#disparo = true
	#else:
		#print("no puedes disparar")
			#
	#if disparo == true:
		#$Link/flecha.show()
		#$Link/flecha.position.y -= 4
		#await get_tree().create_timer(1.2).timeout
		#print("disponible")
		#disparo = false
	if pregunta ==5:
		sailda.show()
		


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		print("puedo disparar")


func _on_timer_timeout():
	print("ENTRE AL TIEMPO")
	if sec==0:
		sec=21
	sec-=1
	if (sec==1) || (sec==0): 
		mostrar_timer.text="00:00"
	elif sec>=0 && sec<=9:
		mostrar_timer.text="0"+":0"+str(sec)
	else:
		mostrar_timer.text="0"+":"+str(sec)
		if pregunta ==5 and sec==15:
			DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"), "start")
			sailda.visible = true
			heart.visible = true
			$Area2D/heart.play("default")
			Global.maxvida+=1
			Global.vida+=1
	if sec==0:
		if sec==0 && pregunta5:
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
			get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
		cambiarPregunta()

func timerReset():
	sec=Dsec

func cambiarPregunta():
	if pregunta==1:
		DialogueManager.show_dialogue_balloon(load("res://shooter2.dialogue"), "start")
		pregunta=2
	elif pregunta==2:
		DialogueManager.show_dialogue_balloon(load("res://shooter3.dialogue"), "start")
		pregunta=3
	elif pregunta==3:
		DialogueManager.show_dialogue_balloon(load("res://shooter4.dialogue"), "start")
		pregunta=4
	elif pregunta==4:
		DialogueManager.show_dialogue_balloon(load("res://shooter5.dialogue"), "start")
		pregunta=5


func _on_area_salida_body_entered(body):
	if body.is_in_group("jugador"):
		Global.maxvida+=1
		Global.vida+=1
		$Area2D.position = Vector2(5000,5000)
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_area_stalfos_d_body_entered(body):
	if body.is_in_group("shoot"):
		print("Estoy dentro!")
		if pregunta>0:
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"),"start")
			timerReset()
			Global.vida-=1
			cambiarPregunta()
	pass


func _on_area_stalfos_c_body_entered(body):
	if body.is_in_group("shoot"):
		print("Estoy dentro!")
		if pregunta==4:
			DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"),"start")
			timerReset()
			cambiarPregunta()
		elif pregunta!=4:
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"),"start")
			timerReset()
			Global.vida-=1
			cambiarPregunta()
	pass


func _on_area_stalfos_b_body_entered(body):
	if body.is_in_group("shoot"):
		print("Estoy dentro!")
		if pregunta!=1 || pregunta!=4:
			DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"),"start")
			timerReset()
			cambiarPregunta()
		elif pregunta==2 || pregunta == 4:
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"),"start")
			timerReset()
			Global.vida-=1
			cambiarPregunta()
	pass


func _on_area_stalfos_a_body_entered(body):
	if body.is_in_group("shoot"):
		print("Estoy dentro!")
		if pregunta==1:
			DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"),"start")
			timerReset()
			cambiarPregunta()
		elif pregunta!=1:
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"),"start")
			timerReset()
			Global.vida-=1
			cambiarPregunta()
	pass
