extends Area2D


export var explosion_scene :PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Bomb2_body_exited(body):
	$StaticBody2D/CollisionShape2D.set_deferred("disabled", false)



func _on_Timer_timeout():
	queue_free()
	var inst = explosion_scene.instance()
	inst.position = position
	get_parent().add_child(inst)
	
