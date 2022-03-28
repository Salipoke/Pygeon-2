extends KinematicBody2D



var base_vel = 250
var vel = Vector2(0,0)
var scene = 0
var dir = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(600,300)
	
func _physics_process(delta):
	vel = Vector2(0,0)
	if Input.is_action_pressed("right"):
		vel += Vector2.RIGHT * base_vel
		dir[0] = 0
	if Input.is_action_pressed("left"):
		vel += Vector2.LEFT * base_vel
		dir[0] = 1
	if Input.is_action_pressed("up"):
		vel += Vector2.UP * base_vel
		dir[1] = 1
	if Input.is_action_pressed("down"):
		vel += Vector2.DOWN * base_vel
		dir[1] = 0
	print(position)
	vel = move_and_collide(vel*delta)
