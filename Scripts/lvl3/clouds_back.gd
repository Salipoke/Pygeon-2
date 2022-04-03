extends Sprite

var rng = RandomNumberGenerator.new()
var pos1 = 1300
var vel = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var num = rand_range(50,100)
	
func _process(delta):
	rng.randomize()
	var num = rand_range(50,100)
	if position.x >= pos1:
		position.x = -250
	position += (num*Vector2.RIGHT*delta)
