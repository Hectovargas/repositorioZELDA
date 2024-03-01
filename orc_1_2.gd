extends CharacterBody2D


func _on_ready():
	$AnimatedSprite2D.play("default")
func _process(delta):
	if Global.dañoenemy==true:
		print("entre1")
		$AnimatedSprite2D.play("daño")
		await get_tree().create_timer(0.8).timeout
		$AnimatedSprite2D.stop()
		Global.dañoenemy=false
	if Global.ataqueenemy==true:
		print("entre2")
		$AnimatedSprite2D.play("ataque")
		$AnimatedSprite2D.scale = Vector2(0.8,0.8)
		await get_tree().create_timer(0.8).timeout
		$AnimatedSprite2D.stop()
		Global.ataqueenemy=false
		$AnimatedSprite2D.play("default")
