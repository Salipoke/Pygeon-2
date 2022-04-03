extends KinematicBody2D



var base_vel = 100
var vel = Vector2(0,0)
var scene = 0
var dir = Vector2(0,0)
var stand = 'stand'


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(600,300)
	
func _physics_process(delta):
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
	print(position)
	vel = move_and_slide(vel)
	anima(vel)
	
func anima(vel:Vector2):
	var modul = sqrt(pow(abs(vel.x),2)+pow(abs(vel.y),2))
	print (vel,modul)
	var animat = $AnimatedSprite
	if modul == 0:
		animat.play(stand)
	if vel.x > 1:
		animat.flip_h = true
		animat.play('walk_left')
		stand = 'st_left'
	if vel.x < -1:
		animat.flip_h = false
		animat.play('walk_left')
		stand = 'st_left'
	if vel.y > 1:
		animat.play('down')
		stand = 'stand'
	if vel.y < -1:
		animat.play('up')
		stand = 'st_up'


func _on_button_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene("res://Scenes/Level Selection/Node2D.tscn")
