extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 400
export var bomb_scene :PackedScene
var vec = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		move_and_collide(Vector2.LEFT*speed*delta)
	if Input.is_action_pressed("move_right"):
		move_and_collide(Vector2.RIGHT*speed*delta)
	if Input.is_action_pressed("move_up"):
		move_and_collide(Vector2.UP*speed*delta)
	if Input.is_action_pressed("move_down"):
		move_and_collide(Vector2.DOWN*speed*delta)
	if Input.is_action_just_pressed("lay_bomb"):
		print("lay")
		var bomb_inst = bomb_scene.instance()
		bomb_inst.position.x = position.x -10
		bomb_inst.position.y = position.y
		get_parent().add_child(bomb_inst)



func _on_Player_input_event(viewport, event, shape_idx):
	print("1")
	print(viewport, event, shape_idx)
