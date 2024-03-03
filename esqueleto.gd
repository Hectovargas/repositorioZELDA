extends CharacterBody2D
var speed = 50
var vida = 3
var player = null
var encontrado = false
var atacando = false
var last_impu = 0
var colisionando = false
var limitarbucle = false
var enemigo = false


func _physics_process(delta):
	move_and_slide()
	
func _process(delta):
	print (position.x)
	print (position.y)
	if atacando == false && vida > 0:
		if encontrado == true:
			position += (player.position-position)/speed
			if (player.position.x-position.x) < 0:
				$AnimatedSprite2D.play("derecha")
				$AnimatedSprite2D.flip_h = true
				last_impu = -1
			elif  (player.position.x-position.x) > 0:
				$AnimatedSprite2D.play("derecha")
				$AnimatedSprite2D.flip_h = false
				last_impu = 1
			elif (player.position.y-position.y) < 0:
				$AnimatedSprite2D.play("arriba")
			elif (player.position.y-position.y) > 0:
				$AnimatedSprite2D.play("abajo")
	if colisionando == true && limitarbucle == false:
		limitarbucle = true
		if Global.pegando == true:
			vida-= 1
			if last_impu == -1:
				position.x = position.x+20
			else:
				position.x = position.x-20
			await get_tree().create_timer(1).timeout
			limitarbucle = false
		else:
			atacando=true
			$AnimatedSprite2D.play("ataque")
			await get_tree().create_timer(0.5).timeout
			atacando=false
			Global.vida -= 1
			await get_tree().create_timer(1.1).timeout
			limitarbucle = false
		if vida <=0 :
			$AnimatedSprite2D.play("muerte")
			limitarbucle = false
			velocity=Vector2(0,0)
			await get_tree().create_timer(1).timeout
			queue_free()
	match vida:
		0:
			$RichTextLabel.hide()
		1:
			$RichTextLabel/coracointainer/cora1.show()
			$RichTextLabel/coracointainer2/cora2.hide()
			$RichTextLabel/coracointainer3/cora3.hide()
		2:
			$RichTextLabel/coracointainer/cora1.show()
			$RichTextLabel/coracointainer2/cora2.show()
			$RichTextLabel/coracointainer3/cora3.hide()
		3:
			$RichTextLabel/coracointainer/cora1.show()
			$RichTextLabel/coracointainer2/cora2.show()
			$RichTextLabel/coracointainer3/cora3.show()
			
func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		player = body
		encontrado = true
		


func _on_area_2d_body_exited(body):
	player = null
	encontrado = false


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Jugador"):
		colisionando=true
	if body.is_in_group("enemy"):
		enemigo=true



func _on_area_2d_2_body_exited(body):
	if body.is_in_group("Jugador"):
		colisionando=false
	if body.is_in_group("enemy"):
		enemigo=false

