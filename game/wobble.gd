extends Node2D

var amplitude = 1
@onready var counter = randf_range(-100, 100)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter += delta * 2
	var y = sin(counter) * amplitude
	position = Vector2(0, y)
