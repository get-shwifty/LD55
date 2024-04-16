extends Node2D
@onready var summon_button = $'../Summon'
var current_spirit = null
var allowed = ["bear", "pattern", "air", "fire", "owl", "water", "eagle"]
# Called when the node enters the scene tree for the first time.
#func _ready():
	#hide_spirit()
	#show_spirit("earth")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func show_spirit(name: String):
	var id = Enums.spirit_map.find(name)
	
	$AnimatedSprite2D.frame = id
	$AnimationPlayer.play("fade_in")
	if name in allowed:
		$AnimatedSprite2D/Particles.visible = true
		$AnimatedSprite2D/Particles.play(name)
	current_spirit = name
	#print('set_spirit ' + name)
	Sound.ctx.invocation.play()
	summon_button.visible = false
	
func hide_spirit():
	$AnimatedSprite2D/Particles.play("default")
	$AnimatedSprite2D/Particles.visible = false
	if current_spirit == null:
		$AnimatedSprite2D.modulate = Color(1,1,1,0)
	else:
		$AnimationPlayer.play_backwards("fade_in")
	current_spirit = null


func _on_selected_cards_clear_hand():
	hide_spirit()
