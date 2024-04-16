extends Node2D

var has_perso = false

func name_to_id(name: String):
	if name == "hototo":
		return 0
	if name == "kaya":
		return 1
	if name == "aponi":
		return 2
	if name == "petrel":
		return 3
	if name == "hyij":
		return 4
	return 0

func select_perso(perso: String):
	if perso == "" or perso == "nobody":
		if has_perso:
			$AnimationPlayer.play_backwards("fade_in")
			has_perso = false
		else:
			$AnimatedSprite2D.modulate = Color(1,1,1,0)
	else:
		has_perso = true
		$AnimationPlayer.play("fade_in")
		$AnimatedSprite2D.frame = name_to_id(perso)

# Called when the node enters the scene tree for the first time.
func _ready():
	select_perso("")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
