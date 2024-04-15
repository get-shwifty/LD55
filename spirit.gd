extends AnimatedSprite2D

var counter = 0.0
var counter2 = 0.0
var amplitude = 8
var direction = 1

var step = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#if counter > amplitude:
		#direction = -1
	#if counter < -amplitude:
		#direction = 1
	#counter += 1 * direction
	#
	#var y = counter
	counter += delta / 1.5
	#var y = round(sin(counter*2) * amplitude * 4) / 4
	var x = sin(counter) * amplitude
	var y = cos(counter*2) * amplitude
	#var x = round(sin(counter) * amplitude/2 * 4) / 4
	#var x = cos(counter) * amplitude / 4.0
	#print(y)
	position = Vector2(x, y/2.0)
