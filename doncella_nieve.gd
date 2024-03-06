extends CharacterBody2D


func _on_territorio_body_entered(body):
	if body.is_in_group("Jugador"):
		if Global.espadahabilitada==true:
			DialogueManager.show_dialogue_balloon(load("res://dialogoDoncella_Nieve.dialogue"), "start")
		else:
			Global.dialogo = true



func _on_territorio_body_exited(body):
	Global.dialogo=false
