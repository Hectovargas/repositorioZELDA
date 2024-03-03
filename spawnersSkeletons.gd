extends Area2D
var spawntime = false
var nodo
var my_node
# Called when the node enters the scene tree for the first time.
func _ready():
	nodo = preload("res://esqueleto.tscn")
	my_node = nodo.instantiate()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawntime == false:
		spawntime=true
		$CollisionShape2D.add_child(my_node)
		$CollisionShape2D2.add_child(my_node)
		$CollisionShape2D3.add_child(my_node)
		$CollisionShape2D4.add_child(my_node)
		$CollisionShape2D5.add_child(my_node)
		await get_tree().create_timer(60).timeout
		spawntime = false
