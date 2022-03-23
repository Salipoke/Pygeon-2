extends KinematicBody2D


var base_vel = 250
var vel = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(512,300)
	
func _physics_process(delta):
	vel = Vector2(0,0)
	if Input.is_action_pressed("right"):
		vel += Vector2.RIGHT * base_vel
	if Input.is_action_pressed("left"):
		vel += Vector2.LEFT * base_vel
	if Input.is_action_pressed("up"):
		vel += Vector2.UP * base_vel
	if Input.is_action_pressed("down"):
		vel += Vector2.DOWN * base_vel
	
	vel = move_and_collide(vel*delta)
	

