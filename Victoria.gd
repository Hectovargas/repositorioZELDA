extends Node2D
var zelda = false
var dialogo = false
var final = true
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.escene = "res://Victoria.tscn"
	$TileMap/portal/AnimatedSprite2D.play("default")
	$TileMap/AnimatedSprite2D.play("default")
	Global.progreso += 3
	if Global.empirista==true:
		$MusicaEmpirista.play()
		$TileMap/impi1.play("new_animation")
		$TileMap/impi2.play("new_animation")
		$TileMap/impi3.play("new_animation")
		$TileMap/impi4.play("new_animation")
		$TileMap/racided1.play("new_animation")
		$TileMap/racided2.play("new_animation")
		$TileMap/racided3.play("new_animation")
		$TileMap/racided4.play("new_animation")
		$TileMap/impi1.show()
		$TileMap/impi2.show()
		$TileMap/impi3.show()
		$TileMap/impi4.show()
		$TileMap/racided1.show()
		$TileMap/racided2.show()
		$TileMap/racided3.show()
		$TileMap/racided4.show()
	else:
		$MusicaRacionalista.play()
		$TileMap/impi5.show()
		$TileMap/impi6.show()
		$TileMap/impi7.show()
		$TileMap/impi8.show()
		$TileMap/impi5.play("default")
		$TileMap/impi6.play("default")
		$TileMap/impi7.play("default")
		$TileMap/impi8.play("default")
		$TileMap/racided5.show()
		$TileMap/racided6.show()
		$TileMap/racided7.show()
		$TileMap/racided8.show()
		$TileMap/racided5.play("default")
		$TileMap/racided6.play("default")
		$TileMap/racided7.play("default")
		$TileMap/racided8.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador") && zelda == false:
		zelda = true
		Global.obtenciontrifuerza = true
		$TileMap/Jugador.show()
		await get_tree().create_timer(2.5).timeout
		$TileMap/Jugador/RichTextLabel2.show()
		$TileMap/Jugador/RichTextLabel2/TextureRect/Label.set_text("Gracias Link, Como agradecimiento te otorgo el poder de la trifuerza")
		await get_tree().create_timer(4).timeout
		$TileMap/Jugador/RichTextLabel2/TextureRect/Label.set_text("Esto te dara acceso unico a un lugar donde conseguiras conocimiento y habilidades")
		await get_tree().create_timer(5).timeout
		$TileMap/Jugador/RichTextLabel2/TextureRect/Label.set_text("llamado la universidad")
		await get_tree().create_timer(5).timeout
		$TileMap/Jugador/RichTextLabel2/TextureRect/Label.set_text("Puedes usar este portal para volver a tu hogar")
		await get_tree().create_timer(2.5).timeout
		$TileMap/Jugador/RichTextLabel2.hide()
		$TileMap/portal.show()
		final = true
		


func _on_portal_body_entered(body):
	if body.is_in_group("Jugador") && final == true:
		$TileMap/Jugador.queue_free()
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://zona Inical.tscn")
