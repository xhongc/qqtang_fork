extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 400
export var bomb_scene :PackedScene
var vec = Vector2.ZERO
onready var anim_player = $AnimationPlayer
var last_action :=""
var now_action :=""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var is_opreate = false
	var action_list = []
	now_action = ""
	if Input.is_action_pressed("move_left") :
		is_opreate=true
		action_list.append("left")
	if Input.is_action_pressed("move_right"):
		is_opreate=true
		action_list.append("right")	
	if Input.is_action_pressed("move_up"):
		is_opreate=true
		action_list.append("up")
	if Input.is_action_pressed("move_down"):
		is_opreate=true
		action_list.append("down")
	if len(action_list) == 1:
		now_action = action_list[0]
	elif len(action_list)==2:
		now_action = action_list[0]
		
	if now_action:
		print("now",now_action)
		if now_action == "left":
			last_action = "left"
			move_and_collide(Vector2.LEFT*speed*delta)
			anim_player.play("walk_left")
		elif now_action == "right":
			last_action = "right"
			move_and_collide(Vector2.RIGHT*speed*delta)
			anim_player.play("walk_right")
		elif now_action == "up":
			last_action = "up"
			move_and_collide(Vector2.UP*speed*delta)
			anim_player.play("walk_up")
		elif now_action == "down":
			last_action = "down"
			move_and_collide(Vector2.DOWN*speed*delta)
			anim_player.play("walk_down")
	if Input.is_action_just_pressed("lay_bomb"):
		var bomb_inst = bomb_scene.instance()
		bomb_inst.position.x = position.x
		bomb_inst.position.y = position.y
		get_parent().add_child(bomb_inst)

	if not is_opreate and last_action:
		print('stop')
		anim_player.stop(false)
		var idle_action = "idle_{last_action}".format({"last_action":last_action})
		anim_player.play(idle_action)
		last_action=""
		


