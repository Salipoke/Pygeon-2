extends KinematicBody2D


var base_vel = 250
var pos1 = 100
var pos2 = 900
var vel = Vector2(0,0)

func _ready():
	position = Vector2(150,0)

func _physics_process(delta):
	if position[0] >= pos2 or position[0] <= pos1:
		base_vel = -base_vel
	position += ((base_vel*Vector2.RIGHT)*delta)
