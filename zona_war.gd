extends Node2D
var pregunta1= false
var pregunta2=false
var pregunta3=false
var pregunta4=false
var pregunta5=false
var pregunta6=false
var pregunta7=false
var pregunta8=false
var preguntado = false
var num=0
var rng := RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(preguntado == false):
		preguntado = true
		while true:
			num = rng.randi_range(1,5)
			if (num == 1 && pregunta1==false):
				$TextureRect2/Label.set_text("A) Empiristas. B) Criticistas. C) Racionalistas. D) Dogmáticos ")
				$TextureRect/Label.set_text("1. Para algunos de los siguientes filósofos, el criterio de verdad es la evidencia sensible:")
				pregunta1=true
				break


func _on_ataque_pressed():
	Global.attacking = true
	$TextureRect.show()
	$TextureRect2.show()
	



func _on_texture_button_pressed():
	pregunta1==true
	$TextureRect.hide()
	$TextureRect2.hide()


func _on_texture_button_2_pressed():
	pass # Replace with function body.


func _on_texture_button_3_pressed():
	pass # Replace with function body.


func _on_texture_button_4_pressed():
	pass # Replace with function body.
