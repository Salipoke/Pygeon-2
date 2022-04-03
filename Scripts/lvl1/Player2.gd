extends KinematicBody2D



var base_vel = 250
var vel = Vector2(0,0)
var door_slide1 = 'False'
var stand = 'stand'
var scene = 0
var dir = Vector2(0,0)
var in_button_move = false
var check = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(512,300)
func _physics_process(delta):
	if check == Vector2(1,1):
		get_tree().change_scene("res://Scenes/Level Selection/Node2D.tscn")
	if in_button_move == true:
		pass
	else:
		vel = Vector2(0,0)
		if Input.is_action_pressed("right"):
			vel += Vector2.RIGHT * base_vel
			dir[0] = 0
		elif Input.is_action_pressed("left"):
			vel += Vector2.LEFT * base_vel
			dir[0] = 1
		elif Input.is_action_pressed("up"):
			vel += Vector2.UP * base_vel
			dir[1] = 1
		elif Input.is_action_pressed("down"):
			vel += Vector2.DOWN * base_vel
			dir[1] = 0
		if door_slide1 == 'True':
			pass
		vel = move_and_slide(vel)
		anima(vel)
	if Input.is_action_pressed('e'):
		in_button_move = false

func anima(vel:Vector2):
	var modul = sqrt(pow(abs(vel.x),2)+pow(abs(vel.y),2))
	print (vel,modul)
	var animat = $AnimatedSprite
	if modul == 0:
		animat.play(stand)
	if vel.x > 1:
		animat.play('walk_right')
		stand = 'st_right'
	if vel.x < -1:
		animat.play('walk_left')
		stand = 'st_left'
	if vel.y > 1:
		animat.play('down')
		stand = 'stand'
	if vel.y < -1:
		animat.play('up')
		stand = 'st_up'
	
func _on_door_button_body_entered(body):
	if body.name == 'Player':
		in_button_move = true


func _on_Area2D_body_entered(body):
	check[0] = 1


func _on_Area2D2_body_entered(body):
	check[1] = 1


func _on_Area2D_body_exited(body):
	check[0] = 0


func _on_Area2D2_body_exited(body):
	check[1] = 0
