extends Node2D
var abrioCofre:bool=false;
var esCofreCorrecto:bool=false;
var esCofreCorrecto2:bool=false;
var esCofreCorrecto3:bool=false;
var esCofreCorrecto4:bool=false;
var esCofreCorrecto5:bool=false;
var contador: int=0;
var contadorQuestion: int=0;
var contadorQuestion2: int=0;
var contadorQuestion3: int=0;
var contadorQuestion4: int=0;
var wincondition = false


func _on_area_2dc_1_body_entered(body):
	if body.is_in_group("Jugador"):
		$Sprite2D.show()
		esCofreCorrecto=true;
		$CHECK1.show()
		$StaticBody2D5.position.x += 50;
		$StaticBody2D5/CollisionShape2D.position.x += 50;
		$PuertaCerrada.hide();
		$audioCorrecto.play();

func _on_area_2dc_2_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto==false:
		$Sprite2D2.show()
		$Sprite2D2/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D2/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();

func _on_area_2dc_3_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto==false:
		$Sprite2D3.show()
		$Sprite2D3/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D3/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();

func _on_area_2dc_4_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto==false:
		$Sprite2D4.show()
		$Sprite2D4/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D4/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();

func _process(delta):
	if wincondition==true:
		$AreaDeSalida.show()
	if Global.vida == 0:
		await get_tree().create_timer(1.5).timeout
		Global.vida=Global.maxvida
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	if contador==0:
		$audioTP.play();
		DialogueManager.show_dialogue_balloon(load("res://artMinigame/Dialogues_Art_MiniGame/questions/question1.dialogue"),"start");
	contador+=1;

func _on_question_zone_2_body_entered(body):
	if body.is_in_group("Jugador"):
		DialogueManager.show_dialogue_balloon(load("res://artMinigame/Dialogues_Art_MiniGame/questions/question2.dialogue"),"start");
		
		if contadorQuestion==0:
			contadorQuestion+=1;
			$A.position.y-=375;
			$B.position.y-=375;
			$C.position.y-=375;
			$D.position.y-=375;
			$StaticBody2D5.position.x -= 50;
			$StaticBody2D5/CollisionShape2D.position.x -= 50;
			$PuertaCerrada.show();
			$audioDoorShut.play();

func _on_question_zone_3_body_entered(body):
	if body.is_in_group("Jugador"):
		DialogueManager.show_dialogue_balloon(load("res://artMinigame/Dialogues_Art_MiniGame/questions/question3.dialogue"),"start");
		if contadorQuestion2==0:
			contadorQuestion2+=1;
			$A.position.y-=380;
			$B.position.y-=380;
			$C.position.y-=380;
			$D.position.y-=380;
			$PuertaCerrada2/StaticBody2D22.position.x -= 50;
			$PuertaCerrada2/StaticBody2D22/CollisionShape2D.position.x -= 50;
			$PuertaCerrada2.show();
			$audioDoorShut.play();


func _on_question_zone_4_body_entered(body):
	if body.is_in_group("Jugador"):
		DialogueManager.show_dialogue_balloon(load("res://artMinigame/Dialogues_Art_MiniGame/questions/question4.dialogue"),"start");
		if contadorQuestion3==0:
			contadorQuestion3+=1;
			$A.position.y-=400;
			$B.position.y-=400;
			$C.position.y-=400;
			$D.position.y-=400;
			$PuertaCerrada3/StaticBody2D.position.x -= 50;
			$PuertaCerrada3/StaticBody2D/CollisionShape2D.position.x -= 50;
			$PuertaCerrada3.show();
			$audioDoorShut.play();


func _on_question_zone_5_body_entered(body):
	if body.is_in_group("Jugador"):
		DialogueManager.show_dialogue_balloon(load("res://artMinigame/Dialogues_Art_MiniGame/questions/question5.dialogue"),"start");
		if contadorQuestion4==0:
			contadorQuestion4+=1;
			$A.position.y-=360;
			$B.position.y-=360;
			$C.position.y-=360;
			$D.position.y-=360;
			$PuertaCerrada4/StaticBody2D.position.x -= 50;
			$PuertaCerrada4/StaticBody2D/CollisionShape2D.position.x -= 50;
			$PuertaCerrada4.show();
			$audioDoorShut.play();


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		$Sprite2D5.show()
		esCofreCorrecto2=true;
		if Global.maxvida>Global.vida:
			Global.vida=Global.vida+1
		$CHECK2.show()
		$PuertaCerrada2/StaticBody2D22.position.x += 50;
		$PuertaCerrada2/StaticBody2D22/CollisionShape2D.position.x += 50;
		$PuertaCerrada2.hide();
		$audioCorrecto.play();


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto2==false:
		$Sprite2D6.show()
		$Sprite2D6/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D6/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();
		


func _on_area_2d_3_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto2==false:
		$Sprite2D7.show()
		$Sprite2D7/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D7/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_4_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto2==false:
		$Sprite2D8.show()
		$Sprite2D8/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D8/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_5_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto3==false:
		$Sprite2D9.show()
		$Sprite2D9/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D9/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_6_body_entered(body):
	if body.is_in_group("Jugador"):
		$Sprite2D10.show()
		esCofreCorrecto3=true;
		$CHECK3.show()
		$PuertaCerrada3/StaticBody2D.position.x += 50;
		$PuertaCerrada3/StaticBody2D/CollisionShape2D.position.x += 50;
		$PuertaCerrada3.hide();
		$audioCorrecto.play();

func _on_area_2d_7_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto3==false:
		$Sprite2D11.show()
		$Sprite2D11/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D11/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_8_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto3==false:
		$Sprite2D12.show()
		$Sprite2D12/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D12/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_9_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto4==false:
		$Sprite2D13.show()
		$Sprite2D13/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D13/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_10_body_entered(body):
	if body.is_in_group("Jugador"):
		$Sprite2D14.show()
		esCofreCorrecto4=true;
		$CHECK4.show()
		$PuertaCerrada4/StaticBody2D.position.x += 50;
		$PuertaCerrada4/StaticBody2D/CollisionShape2D.position.x += 50;
		$PuertaCerrada4.hide();
		$audioCorrecto.play();


func _on_area_2d_11_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto4==false:
		$Sprite2D15.show()
		$Sprite2D15/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D15/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_12_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto4==false:
		$Sprite2D16.show()
		$Sprite2D16/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D16/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_13_body_entered(body):
	if body.is_in_group("Jugador"):
		$Sprite2D17.show()
		esCofreCorrecto5=true;
		wincondition=true
		$CHECK5.show()
		$PuertaCerrada5/StaticBody2D.position.x += 50;
		$PuertaCerrada5/StaticBody2D/CollisionShape2D.position.x += 50;
		$PuertaCerrada5.hide();
		$audioCorrecto.play();


func _on_area_2d_14_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto5==false:
		$Sprite2D18.show()
		$Sprite2D18/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D18/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_15_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto5==false:
		$Sprite2D19.show()
		$Sprite2D19/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D19/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();


func _on_area_2d_16_body_entered(body):
	if body.is_in_group("Jugador") && esCofreCorrecto5==false:
		$Sprite2D20.show()
		$Sprite2D20/AnimatedSprite2D.play("default")
		await  get_tree().create_timer(1.2).timeout
		$Sprite2D20/AnimatedSprite2D.stop()
		Global.vida=Global.vida-1
		$audioInCorrecto.play();



func _on_area_change_scene_body_entered(body):
	if body.is_in_group("Jugador"):
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_area_de_salida_body_entered(body):
	if body.is_in_group("Jugador"):
		if(wincondition==true):
			Global.maxvida+=1
			Global.vida=Global.maxvida
			$AreaDeSalida.position = Vector2(1000,1000)
			await get_tree().create_timer(0.5).timeout
			$AreaDeSalida.hide()
			wincondition=false
