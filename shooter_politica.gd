extends Node2D
var disparo = false

#var pregunta1 = DialogueManager.show_dialogue_balloon(load("res://shooter1.dialogue"),"start")
#var pregunta2 = DialogueManager.show_dialogue_balloon(load("res://shooter2.dialogue"), "start")
#var pregunta3 = DialogueManager.show_dialogue_balloon(load("res://shooter3.dialogue"), "start")
#var pregunta4 = DialogueManager.show_dialogue_balloon(load("res://shooter4.dialogue"), "start")
#var pregunta5 = DialogueManager.show_dialogue_balloon(load("res://shooter5.dialogue"), "start")
#var fallaste = DialogueManager.show_dialogue_balloon(load("res://shooterFallaste.dialogue"), "start")

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(load("res://shooterInico.dialogue"),"start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_Z):
		DialogueManager.show_dialogue_balloon(load("res://shooter1.dialogue"),"start")
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
		


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		print("puedo disparar")


func _on_arrow_area_entered(area):
	if area.is_in_group("enemy"):
		print("memoriiii")
		var stalf = area.get_parent()
		stalf.die()
