extends KinematicBody2D



var base_vel = 250
var vel = Vector2(0,0)
var door_slide1 = 'False'
export var inertia = 50
var scene = 0
var dir = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(512,300)
	
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
	if door_slide1 == 'True':
		pass
	vel = move_and_collide(vel*delta)
	if Input.is_action_pressed('e') and vel and get_tree().current_scene.name == 'Node2D':
		scene = 1


func _on_Area2D_body_entered(body):
	pass # Replace with function body.