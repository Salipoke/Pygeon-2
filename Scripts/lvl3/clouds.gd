extends Sprite

var rng = RandomNumberGenerator.new()
var pos1 = -250
var vel = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var num = rand_range(50,250)
	
func _process(delta):
	rng.randomize()
	var num = rand_range(50,250)
	if position[0] <= pos1:
		position[0] = 1300
	position += (num*Vector2.LEFT*delta)
#	position += (num*Vector2.RIGHT)*delta
