extends CharacterBody2D

func _on_territorio_body_entered(body):
	if body.is_in_group("Jugador"):
		DialogueManager.show_dialogue_balloon(load("res://Dialogo_Doncella.dialogue"), "start")
