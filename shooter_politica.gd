extends Node2D
var disparo = false
var fallosresp = 0
var win = true
var buenosresp = 0
var pregunta = 0
@onready var sailda = $Sailda
@onready var heart = $Area2D/heart
@onready var label = $Area2D/Label

# Called when the node enters the scene tree for the first time.	
func _ready():
	_on_timer_timeout()
	timerReset()
	DialogueManager.show_dialogue_balloon(load("res://ahooterinicio2.dialogue"),"start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sailda.hide()
	if Input.is_key_pressed(KEY_Z):
		pregunta = 1
		DialogueManager.show_dialogue_balloon(load("res://shooter1.dialogue"),"start")
		print("pregunta #: " +  str(pregunta))
	elif Input.is_key_pressed(KEY_C):
		pregunta = 2
		DialogueManager.show_dialogue_balloon(load("res://shooter2.dialogue"), "start")
		print("pregunta #: " +  str(pregunta))
	elif Input.is_key_pressed(KEY_V):
		pregunta = 3
		DialogueManager.show_dialogue_balloon(load("res://shooter3.dialogue"), "start")
		print("pregunta #: " +  str(pregunta))
	elif Input.is_key_pressed(KEY_B):
		pregunta = 4
		DialogueManager.show_dialogue_balloon(load("res://shooter4.dialogue"), "start")
		print("pregunta #: " +  str(pregunta))
	elif Input.is_key_pressed(KEY_N):
		pregunta = 5
		DialogueManager.show_dialogue_balloon(load("res://shooter5.dialogue"), "start")
		print("pregunta #: " +  str(pregunta))
		if win == true:
			sailda.visible = true
			heart.visible = true
			label.visible = true
			$Area2D/heart.play("default")
			Global.maxvida+=1
			Global.vida+=1
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



func _on_area_salida_area_entered(area):
	get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_area_stalfos_c_area_entered(area):
	if area is Arrow:
		print("tocaron al C!!")
		if pregunta == 1:
			fallosresp +=1
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
		elif pregunta == 2:
			fallosresp+=1
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
		elif pregunta == 3:
			fallosresp+=1
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
		elif pregunta == 4:
			buenosresp+=1
			DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"), "start")
		elif pregunta == 5:
			fallosresp+=1
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")


func _on_area_stalfos_a_body_entered(body):
	if body.is_in_group("Arrow"):
		print("tocaron al A!!")
		if pregunta == 1:
			buenosresp+=1
			DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"), "start")
		elif pregunta == 2:
			fallosresp+=1
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
		elif pregunta == 3:
			fallosresp+=1
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
		elif pregunta == 4:
			fallosresp+=1
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
		elif pregunta == 5:
			fallosresp+=1
			DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")


func _on_area_2d_area_entered(area):
	Global.maxvida+=1
	Global.vida+=1
	$Area2D.position = Vector2(5000,5000)
	


func _on_area_stalfos_b_area_entered(area):
	print("tocaron al B!!")
	if pregunta == 1:
		fallosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
	elif pregunta == 2:
		buenosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"), "start")
	elif pregunta == 3:
		buenosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"), "start")
	elif pregunta == 4:
		fallosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
	elif pregunta == 5:
		buenosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterCorrecto.dialogue"), "start")
		


func _on_area_stalfos_d_area_entered(area):
	print("tocaron al D!!")
	if pregunta == 1:
		fallosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
	elif pregunta == 2:
		fallosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
	elif pregunta == 3:
		fallosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
	elif pregunta == 4:
		fallosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
	elif pregunta == 5:
		fallosresp+=1
		DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")
		

var sec=0
var Dsec=1
func _on_timer_timeout():
	print("ENTRE AL TIEMPO")
	while sec<=20:
		sec+=1
		if (sec==1) || (sec==00): 
			$MostrarTimer.text="00:00"
			print(str(sec))
		elif sec>=0 && sec<=9:
			$MostrarTimer.text="0"+":0"+str(sec)
			print(str(sec))
		else:
			$MostrarTimer.text="0"+":"+str(sec)
			print(str(sec))
	if sec>20:
		
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	pass

func timerReset():
	sec=Dsec
