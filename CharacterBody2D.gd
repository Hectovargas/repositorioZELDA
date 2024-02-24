extends CharacterBody2D

func _ready():
	add_to_group("enemy")
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
		velocity.y += 1
