class_name Stalfos extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 1

func _physics_process(delta):
	global_position.y += speed * delta
	move_and_slide()

func die():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("jugador"):
		$AnimatedSprite2D.play("dead")
		body.die()
		die()
	get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")

