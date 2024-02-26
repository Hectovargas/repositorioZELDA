extends CharacterBody2D

func _on_ready():
	$AnimatedSprite2Dpass.play("default")
	
func _process(delta):
	if Global.dañoenemy4==true:
		$AnimatedSprite2D.play("daño")
		await get_tree().create_timer(0.8).timeout
		$AnimatedSprite2D.stop()
		Global.dañoenemy4=false
