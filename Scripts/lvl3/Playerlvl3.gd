extends KinematicBody2D



var base_vel = 100
var jump = 400 * Vector2.UP
var jump_cont = 1
var slide = 0
var vel = Vector2.DOWN * base_vel
var grav = Vector2.DOWN * 980
var dir = Vector2(0,0)
var slide_check = false


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(50,550)
	
func _physics_process(delta):
	if Input.is_action_pressed("right"):
		vel += Vector2.RIGHT * base_vel
		dir[0] = 0
	if Input.is_action_pressed("left"):
		vel += Vector2.LEFT * base_vel
		dir[0] = 1
	if Input.is_action_just_pressed("space") and jump_cont != 0:
		vel.x += 10
		jump_cont -= 1
		vel.y = 0
		vel += jump
		dir[1] = 1
	if is_on_floor() == true:
		jump_cont = 1
		slide_check = false
	if Input.is_action_pressed("shift") and slide_check == false:
		slide_check = true
		slide = 2
	if slide != 0:
		print ('-')
		slide -= 0.5
		vel.x *= 5
	vel += grav*delta
	vel = move_and_slide(vel,Vector2.UP)
