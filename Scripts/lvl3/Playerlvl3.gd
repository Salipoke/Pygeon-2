extends KinematicBody2D



var base_vel = 150
var jump = 400 * Vector2.UP
var jump_cont = 1
var slide = 0
var vel = Vector2.DOWN * base_vel
var grav = Vector2.DOWN * 980
var dir = Vector2(0,0)
var slide_check = false
var stand = 'stand'
var death = false
var on_wall = false
var on_wall_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(50,500)
	
func _physics_process(delta):
	vel.x = 0
	on_wall = false
	if position.y >= 550:
		position = Vector2(50,500)
#	if is_on_wall() == true and is_on_floor() == false and vel.y > 0:
#		on_wall = true
#		vel.y /= 2
#		slide_check = false
#		jump_cont = 1
	if Input.is_action_pressed("right"):
		vel += Vector2.RIGHT * base_vel
		dir[0] = 0
	if Input.is_action_pressed("left"):
		vel += Vector2.LEFT * base_vel
		dir[0] = 1
	if Input.is_action_just_pressed("space") and jump_cont != 0 or Input.is_action_just_pressed('up') and jump_cont != 0:
		vel.x += 10
		jump_cont -= 1
		vel.y = 0
		vel += jump
		dir[1] = 1
	if is_on_floor() == true:
		on_wall = false
		jump_cont = 1
		slide_check = false
	if Input.is_action_pressed("shift") and slide_check == false:
		slide_check = true
		slide = 2
	if slide != 0:
		if dir[0] == 1:
			vel += Vector2.LEFT * base_vel
		else:
			vel += Vector2.RIGHT * base_vel
		print ('-')
		slide -= 0.5
		vel.x *= 5
		if vel.y > 0:
			vel.y = 0
	vel += grav*delta
	vel = move_and_slide(vel,Vector2.UP)
	anima(vel)
	
func anima(vel:Vector2):
	var modul = int(sqrt(pow(abs(vel.x),2)+pow(abs(vel.y),2)))
	var animat = $AnimatedSprite
	print (vel,modul)
	if modul == 0:
		animat.play(stand)
		print ('st')
	if vel.y < -10:
		animat.play('jump')
		print ('jm')
	if vel.x > 10:
		animat.flip_h = false
		animat.play('walk_left')
		print ('wl')
	if vel.x < -10:
		animat.flip_h = true
		animat.play('walk_left')
		print ('wr')
	if vel.y > 10:
		animat.play('fall')
		print ('fl')
	if slide != 0:
		if is_on_floor() == true:
			animat.play('slide_floor')
		if is_on_floor() != true:
			animat.play('slide_air')
		print ('sd')
#	if on_wall == true:
#		if dir[0] == 1:
#			animat.flip_h = true
#			animat.play('on_wall')
#		else:
#			animat.flip_h = false
#			animat.play('on_wall')


func _on_Area2D_body_entered(body):
	if body.name == ('Player'):
		get_tree().change_scene("res://Scenes/Level Selection/Node2D.tscn")
