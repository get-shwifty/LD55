extends Node2D

var current_spirit = null

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_spirit()
	show_spirit("earth")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func show_spirit(name: String):
	var id = 0
	if name == "air":
		id = 0
	if name == "water":
		id = 1
	if name == "fire":
		id = 2
	if name == "earth":
		id = 3
	if name == "void":
		id = 4
		
	$AnimatedSprite2D.frame = id
	$AnimationPlayer.play("fade_in")
	current_spirit == name
	
func hide_spirit():
	if current_spirit == null:
		$AnimatedSprite2D.modulate = Color(1,1,1,0)
	else:
		$AnimationPlayer.play_backwards("fade_in")
	current_spirit = null
