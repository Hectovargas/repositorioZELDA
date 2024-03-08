extends CharacterBody2D
var Speed = 140
var LastDirection = Vector2.ZERO
var AnimatedSprite
var vivo=true
var currentvida
var contador:int=0
var last_input
func _ready():
	currentvida = Global.vida
	AnimatedSprite = $AnimatedSprite2D
	add_to_group("Jugador")

func _physics_process(delta):
	move_and_slide()
	

func _process(delta):
	if Input.is_key_pressed(KEY_G):
		$TextureProgressBar.value = Global.progreso
		$TextureProgressBar.show()
		$RichTextLabel.hide()
		$TextureProgressBar/Label.set_text(str($TextureProgressBar.value) + "%")
		await get_tree().create_timer(2.5).timeout;
		$TextureProgressBar.hide()
	controldireccion()
	if Global.logo1== true:
		$RichTextLabel/Sprite2D.show()
	if Global.logo2== true:
		$RichTextLabel/Sprite2D3.show()
	if Input.is_key_pressed(KEY_SPACE) && Global.espadahabilitada==true && Global.pegando==false && Global.vida>0:
		velocity=Vector2(0,0)
		Global.pegando=true
		if last_input == "ui_right":
			$AnimatedSprite2D.play("Attack_Right")
		elif last_input == "ui_up":
			$AnimatedSprite2D.play("attackup")
		elif last_input == "ui_down":
			$AnimatedSprite2D.play("attackdown")
		elif last_input == "ui_left":
			$AnimatedSprite2D.play("Attack_Right")
		await get_tree().create_timer(1.3).timeout
		Global.pegando=false
	if Global.pegando == false:
		if Global.trifuerza==true:
			$RichTextLabel/Sprite2D2.show()
		if Global.estoyencombate == false:
			$RichTextLabel.position = Vector2(-51,-39)
		else:
			if Global.nacionalista==true:
				$RichTextLabel.position = Vector2(-89,-80)
			else:
				$RichTextLabel.position = Vector2(10,-80)
		if Global.empirista == true:
			$RichTextLabel/LOGOEMPIRISTA.show()
		if Global.nacionalista == true:
			$RichTextLabel/LOGORACIONALISTA.show()
		if Global.sword==true && contador==0: 
			AnimatedSprite.play("sword");
			await get_tree().create_timer(1).timeout;
			contador+=1;
		elif Global.obtenciongema == true:
			AnimatedSprite.play("obtenciongema");
			velocity=Vector2(0,0)
			if(Global.nacionalista==true):
				$LOGORACIONALISTA.show()
			else:
				$LOGOEMPIRISTA.show()
			await get_tree().create_timer(2.5).timeout;
			$LOGORACIONALISTA.hide()
			$LOGOEMPIRISTA.hide()
			Global.obtenciongema = false
		elif Global.obtenciontrifuerza == true:
			$Sprite2D2.show()
			$AnimatedSprite2D.play("obtencionTrifuerza")
			Global.trifuerza=true
			await get_tree().create_timer(2.5).timeout;
			Global.obtenciontrifuerza=false
			$Sprite2D2.hide()
		else:
			if Input.is_key_pressed(KEY_F):
				$RichTextLabel.show()
				$TextureProgressBar.hide()
				await get_tree().create_timer(3).timeout
				$RichTextLabel.hide()
				
			if currentvida != Global.vida:
				currentvida=Global.vida
				$RichTextLabel.show()
				await get_tree().create_timer(3).timeout
				$RichTextLabel.hide()
			
				
			match Global.vida:
				0:
					$RichTextLabel.hide()
					$RichTextLabel/coracointainer/cora1.hide()
				1:
					$RichTextLabel/coracointainer/cora1.show()
					$RichTextLabel/coracointainer2/cora2.hide()
					$RichTextLabel/coracointainer4/cora4.hide()
					$RichTextLabel/coracointainer5/cora5.hide()
					$RichTextLabel/coracointainer6/cora6.hide()
					$RichTextLabel/coracointainer3/cora3.hide()
					$RichTextLabel/coracointainer7/cora7.hide()
				2:
					$RichTextLabel/coracointainer/cora1.show()
					$RichTextLabel/coracointainer2/cora2.show()
					$RichTextLabel/coracointainer3/cora3.hide()
					$RichTextLabel/coracointainer4/cora4.hide()
					$RichTextLabel/coracointainer5/cora5.hide()
					$RichTextLabel/coracointainer6/cora6.hide()
					$RichTextLabel/coracointainer7/cora7.hide()
				3:
					$RichTextLabel/coracointainer/cora1.show()
					$RichTextLabel/coracointainer2/cora2.show()
					$RichTextLabel/coracointainer3/cora3.show()
					$RichTextLabel/coracointainer4/cora4.hide()
					$RichTextLabel/coracointainer5/cora5.hide()
					$RichTextLabel/coracointainer6/cora6.hide()
					$RichTextLabel/coracointainer7/cora7.hide()
				4:
					$RichTextLabel/coracointainer/cora1.show()
					$RichTextLabel/coracointainer2/cora2.show()
					$RichTextLabel/coracointainer3/cora3.show()
					$RichTextLabel/coracointainer4/cora4.show()
					$RichTextLabel/coracointainer5/cora5.hide()
					$RichTextLabel/coracointainer6/cora6.hide()
					$RichTextLabel/coracointainer7/cora7.hide()
				5:
					$RichTextLabel/coracointainer/cora1.show()
					$RichTextLabel/coracointainer2/cora2.show()
					$RichTextLabel/coracointainer3/cora3.show()
					$RichTextLabel/coracointainer4/cora4.show()
					$RichTextLabel/coracointainer5/cora5.show()
					$RichTextLabel/coracointainer6/cora6.hide()
					$RichTextLabel/coracointainer7/cora7.hide()
				6:
					$RichTextLabel/coracointainer/cora1.show()
					$RichTextLabel/coracointainer2/cora2.show()
					$RichTextLabel/coracointainer3/cora3.show()
					$RichTextLabel/coracointainer4/cora4.show()
					$RichTextLabel/coracointainer5/cora5.show()
					$RichTextLabel/coracointainer6/cora6.show()
					$RichTextLabel/coracointainer7/cora7.hide()
				7:
					$RichTextLabel/coracointainer/cora1.show()
					$RichTextLabel/coracointainer2/cora2.show()
					$RichTextLabel/coracointainer3/cora3.show()
					$RichTextLabel/coracointainer4/cora4.show()
					$RichTextLabel/coracointainer5/cora5.show()
					$RichTextLabel/coracointainer6/cora6.show()
					$RichTextLabel/coracointainer7/cora7.show()
				
			match Global.maxvida:
				1:
					$RichTextLabel/coracointainer.show()
				2:
					$RichTextLabel/coracointainer.show()
					$RichTextLabel/coracointainer2.show()
				3:
					$RichTextLabel/coracointainer.show()
					$RichTextLabel/coracointainer2.show()
					$RichTextLabel/coracointainer3.show()
				4:
					$RichTextLabel/coracointainer.show()
					$RichTextLabel/coracointainer2.show()
					$RichTextLabel/coracointainer3.show()
					$RichTextLabel/coracointainer4.show()
				5:
					$RichTextLabel/coracointainer.show()
					$RichTextLabel/coracointainer2.show()
					$RichTextLabel/coracointainer3.show()
					$RichTextLabel/coracointainer4.show()
					$RichTextLabel/coracointainer5.show()
				6:
					$RichTextLabel/coracointainer.show()
					$RichTextLabel/coracointainer2.show()
					$RichTextLabel/coracointainer3.show()
					$RichTextLabel/coracointainer4.show()
					$RichTextLabel/coracointainer5.show()
					$RichTextLabel/coracointainer6.show()
				7:
					$RichTextLabel/coracointainer.show()
					$RichTextLabel/coracointainer2.show()
					$RichTextLabel/coracointainer3.show()
					$RichTextLabel/coracointainer4.show()
					$RichTextLabel/coracointainer5.show()
					$RichTextLabel/coracointainer6.show()
					$RichTextLabel/coracointainer7.show()

			if Global.caida==true:
				$AnimatedSprite2D.stop()
				$AnimatedSprite2D.play("CAIDA")
				velocity=Vector2(0,30)
			elif Global.pescar:
				$AnimatedSprite2D.stop()
				$AnimatedSprite2D.play("pesca")
				$AnimatedSprite2D.play("standpesca")
			elif Global.attacking==true:
				$AnimatedSprite2D.play("Attack_Right")
				await get_tree().create_timer(1).timeout
				Global.attacking = false
			elif Global.ataqueinverso==true:
				$AnimatedSprite2D.play("attack_left")
				await get_tree().create_timer(1).timeout
				Global.ataqueinverso = false
			elif Global.flechando == true:
				$AnimatedSprite2D.play("disparoflecha")
				await get_tree().create_timer(1).timeout
				Global.flechando = false
			elif Global.posicionbatalla==true:
				$AnimatedSprite2D.play("posicionbatalla")
			elif Global.posicionbatallainversa == true:
				$AnimatedSprite2D.play("posicionbatallainversa")
			elif Global.muerteencombate == true:
				$AnimatedSprite2D.play("MUERTO")
				await get_tree().create_timer(1).timeout
				$AnimatedSprite2D.play("MUERTEDEFINITIVA")
				await get_tree().create_timer(1).timeout
				Global.muerteencombate = false
			else:
				if Global.vida < 1:
					vivo = false
					$AnimatedSprite2D.stop()
					velocity=Vector2(0,0)
					$AnimatedSprite2D.play("MUERTEDEFINITIVA")
				else:
					if Global.nadando==false:
						var Direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
						velocity = Direction * Speed
						
						
						if Direction != Vector2.ZERO:
							LastDirection=Direction
						
						if Direction.x!=0:
							AnimatedSprite.play("WalkRight")
							
						elif Direction.y <0:
							AnimatedSprite.play("WalkUp")
						elif Direction.y >0:
							AnimatedSprite.play("WalkDown")
						else:
							if LastDirection.x !=0:
								AnimatedSprite.play("Idle_Right")
							elif LastDirection.y <0:
								AnimatedSprite.play("Idle_up")
							elif LastDirection.y >0:
								AnimatedSprite.play("Idle_Down")
						AnimatedSprite.flip_h = LastDirection.x >0
					else:
						var Direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
						velocity = Direction * Speed
						
						
						if Direction != Vector2.ZERO:
							LastDirection=Direction
						
						if Direction.x!=0:
							AnimatedSprite.play("nadoladoizq")
							
						elif Direction.y <0:
							AnimatedSprite.play("nadoatras")
						elif Direction.y >0:
							AnimatedSprite.play("Nadofrente")
						elif Direction==Vector2(0,0):
							AnimatedSprite.play("standnado")
						else:
							if LastDirection.x !=0:
								AnimatedSprite.play("Idle_Right")
							elif LastDirection.y <0:
								AnimatedSprite.play("Idle_up")
							elif LastDirection.y >0:
								AnimatedSprite.play("Idle_Down")
						AnimatedSprite.flip_h = LastDirection.x >0
			

func _on_boton_de_preguntas_body_entered(body):
	pass # Replace with function body.

func die():
	queue_free()
	
func controldireccion():
	if Input.is_action_pressed("ui_right"):
		last_input = "ui_right"
	elif  Input.is_action_pressed("ui_left"):
		last_input = "ui_left"
	elif Input.is_action_pressed("ui_up"):
		last_input = "ui_up"
	elif Input.is_action_pressed("ui_down"):
		last_input = "ui_down"
