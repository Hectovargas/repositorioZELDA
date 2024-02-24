extends Node2D

var stalfos_scene: = preload("res://stalfos.tscn")
var spawn_points: = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	var spawn = spawn_points[randi() % spawn_points.size()]
	var stalfoss = stalfos_scene.instantiate()
	stalfoss.position = spawn.position
