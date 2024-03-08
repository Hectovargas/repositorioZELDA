extends CharacterBody2D
func _on_ready():
	$AnimatedSprite2D.play("default")
func _process(delta):
	if Global.dañoenemy3==true:
		$AnimatedSprite2D.play("daño")
		await get_tree().create_timer(0.8).timeout
		$AnimatedSprite2D.stop()
		Global.dañoenemy3=false
	if Global.ataqueenemy3==true:
		print("entre2")
		$AnimatedSprite2D.play("ataque")
		$AnimatedSprite2D.scale = Vector2(0.8,0.8)
		await get_tree().create_timer(0.8).timeout
		$AnimatedSprite2D.stop()
		Global.ataqueenemy3=false
		$AnimatedSprite2D.play("idle")
