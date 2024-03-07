extends CharacterBody2D
func _on_ready():
	$AnimatedSprite2D.play("default")
func _process(delta):
	if Global.dañoenemy2==true:
		print("entre2")
		$AnimatedSprite2D.play("daño")
		await get_tree().create_timer(0.8).timeout
		$AnimatedSprite2D.stop()
		Global.dañoenemy2=false
	if Global.ataqueenemy2==true:
		print("entre2")
		$AnimatedSprite2D.play("ataque")
		$AnimatedSprite2D.scale = Vector2(0.18,0.18)
		await get_tree().create_timer(0.8).timeout
		$AnimatedSprite2D.stop()
		Global.ataqueenemy2=false
		$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.scale = Vector2(1,1)
