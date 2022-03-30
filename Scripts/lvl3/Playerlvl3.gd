extends KinematicBody2D



var base_vel = 250
var jump = 400 * Vector2.UP
var vel = Vector2.DOWN * base_vel
var door_slide1 = 'False'
var grav = Vector2.DOWN * 980
var scene = 0
var dir = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(512,300)
	
func _physics_process(delta):
	vel.x = 0
	if Input.is_action_pressed("right"):
		vel += Vector2.RIGHT * base_vel
		dir[0] = 0
	if Input.is_action_pressed("left"):
		vel += Vector2.LEFT * base_vel
		dir[0] = 1
	if Input.is_action_pressed("up"):
		vel.y = 0
		vel += jump
		dir[1] = 1
	vel += grav*delta
	vel = move_and_slide(vel,Vector2.UP)
