extends Node2D
var disparo = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_Q):
		if disparo == false:
			Global.flechando=true
			disparo=true
			var flecha = $TileMap/Link/flecha.duplicate()
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
		


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		print("me metieron la flecha")
